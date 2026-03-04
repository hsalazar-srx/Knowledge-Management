---
topic: "IIS deployment for ASP.NET Core applications on Windows Server"
category: deployment
projects:
  - SM-Portal
  - MyInvois-Service
  - MOVEX-REST-API
last_updated: 2026-03-04
related_decisions: []
related_risks: []
---

## Purpose

This runbook captures IIS deployment lessons learned across SM-Portal, MyInvois-Service, and MOVEX REST API. Each issue below was encountered in production and has a verified fix. Read this before every IIS deployment.

**Time saved by reading this first: 8+ hours** (based on SM-Portal deployment incident log).

---

## Prerequisites

- .NET 8.0 Hosting Bundle installed on the server (not just the Runtime)
- IIS 10.0+ with ASP.NET Core Module (ANCM) v2 installed
- Application pool set to **No Managed Code** (not .NET CLR version)
- Deployment user has write permissions to the site folder

---

## Issue 1: Content Root Path Mismatch

**Symptom:** Application starts but cannot find static files, views, or configuration files. Error: `System.IO.FileNotFoundException` for files that exist on disk.

**Root cause:** The `ContentRootPath` defaults to the working directory at startup. Under IIS, this can resolve to `C:\Windows\System32` instead of the site folder.

**Fix:**
```xml
<!-- web.config -->
<aspNetCore processPath="dotnet"
            arguments=".\YourApp.dll"
            stdoutLogEnabled="true"
            stdoutLogFile=".\logs\stdout"
            hostingModel="InProcess">
  <environmentVariables>
    <environmentVariable name="ASPNETCORE_CONTENTROOT" value="%APPL_PHYSICAL_PATH%" />
  </environmentVariables>
</aspNetCore>
```

**Prevention:** Always set `ASPNETCORE_CONTENTROOT` in web.config on IIS deployments.

---

## Issue 2: Windows Authentication Conflicts with Negotiate

**Symptom:** 401 Unauthorized on all requests, even with correct credentials. IIS logs show `AUTH_START` but no `AUTH_SUCCESS`.

**Root cause:** IIS-level Windows Authentication is enabled AND the application also attempts to configure authentication. The two layers conflict.

**Fix:**
- If using Windows Auth: disable in-app auth configuration and let IIS handle it exclusively
- In `appsettings.json`: ensure `AllowedHosts` includes the server hostname
- In IIS: set Authentication → Windows Authentication = Enabled, Anonymous Authentication = Disabled
- In `Program.cs`: add `builder.Services.AddAuthentication(IISDefaults.AuthenticationScheme)`

**Prevention:** Decide at architecture time whether auth is IIS-managed or app-managed. Never configure both.

---

## Issue 3: Multiple App Pools Interfering

**Symptom:** Application works after deploy but breaks after a few hours. Requests return mixed responses.

**Root cause:** Two deployments running under different app pools pointing to the same physical path. Both serve the same site and share the `Data Protection` key store, causing key conflicts.

**Fix:**
- One physical path = one app pool, always
- Verify with: `%SystemRoot%\System32\inetsrv\appcmd list site`
- Stop and remove the duplicate app pool

**Prevention:** Before deploying, check that the target physical path is not already assigned to another app pool.

---

## Issue 4: Kestrel Port Conflicts

**Symptom:** Application fails to start. Windows Event Log shows: `Failed to bind to address http://0.0.0.0:5000: address already in use`.

**Root cause:** Another process is listening on the default Kestrel port (5000). Under IIS InProcess hosting, Kestrel ports are managed by IIS — this usually means there are two InProcess apps configured.

**Fix:**
- For InProcess hosting: do not set `ASPNETCORE_URLS` in environment variables — let IIS control the port
- For OutOfProcess hosting: assign a unique port per application in `appsettings.json`
- Check for conflicts: `netstat -ano | findstr :5000`

**Prevention:** Use InProcess hosting where possible (better performance). If OutOfProcess is required, assign explicit unique ports in configuration.

---

## Issue 5: Frontend/Backend Routing Conflict (React SPA + API)

**Symptom:** React app loads on `/`, but API calls to `/api/...` return the React `index.html` instead of JSON.

**Root cause:** The SPA fallback routing (`app.MapFallbackToFile("index.html")`) intercepts all unmatched routes, including API routes that are not yet registered.

**Fix in `Program.cs`:**
```csharp
// API routes MUST be mapped before the SPA fallback
app.MapControllers();           // Register API routes first
app.UseStaticFiles();
app.MapFallbackToFile("index.html");  // SPA fallback last
```

**Prevention:** Always register API controllers before `MapFallbackToFile`. Add a smoke test that calls an API endpoint and verifies JSON response (not HTML).

---

## Issue 6: Data Protection Keys Not Persisted

**Symptom:** Users are logged out on every app pool recycle. Anti-forgery tokens are invalid after restart.

**Root cause:** ASP.NET Core Data Protection keys are stored in-memory by default. App pool recycles flush them.

**Fix:**
```csharp
builder.Services.AddDataProtection()
    .PersistKeysToFileSystem(new DirectoryInfo(@"C:\inetpub\keys\{AppName}"))
    .SetApplicationName("{AppName}");
```

Create the keys directory and grant the app pool identity read/write access.

**Prevention:** Always configure persistent Data Protection key storage in `Program.cs` for any app with authentication or anti-forgery tokens.

---

## Deployment Checklist

Run this before every deployment to production:

```
Pre-deployment (24 hours before):
[ ] Build passes locally: dotnet build --configuration Release
[ ] All tests pass: dotnet test
[ ] appsettings.Production.json reviewed — no dev values
[ ] Secrets confirmed in production secrets store (not in config files)

Deployment:
[ ] Stop the app pool (graceful)
[ ] Copy build output to deployment folder
[ ] Verify web.config has ASPNETCORE_CONTENTROOT set
[ ] Verify app pool is "No Managed Code"
[ ] Start the app pool

Verification:
[ ] Health endpoint responds: GET /health → 200
[ ] If Windows Auth: authenticated request succeeds
[ ] If SPA: static files load, API calls return JSON (not HTML)
[ ] Check application event log for startup errors
[ ] Check stdout log (./logs/stdout*.log) if available

Rollback (if needed):
[ ] Stop app pool
[ ] Restore previous build from backup folder
[ ] Start app pool
[ ] Verify health endpoint
```

---

## Environment Parity Validation

Always run environment parity checks before deploying to production:

```powershell
# Check .NET version parity
dotnet --version  # must match development version

# Check IIS module version
Get-WebConfiguration -Filter "system.webServer/globalModules/add[@name='AspNetCoreModuleV2']" | Select-Object *

# Check app pool settings
Import-Module WebAdministration
Get-WebConfiguration -Filter "system.applicationHost/applicationPools/add[@name='{PoolName}']" | Select-Object *
```
