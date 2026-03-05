11/02/2026 
===============
Transcript from [Meeting][Bryan][Karen][Max]
================

AI-generated content may be incorrect

BF

Bryan Fu
0 minutes 3 seconds0:03
Bryan Fu 0 minutes 3 seconds
is set up in our factory. So from customer order, I can understanding they have material sales or some our manufacturing order sales, so I can easily recognize. But in GRB, I found they only using 100, but with some information I get from Hector, even
Bryan Fu 0 minutes 24 seconds
we are defined 100 is not allowed to use. So it's totally mixed for me what is right definition or what is right setup in system for our custom order.
MW

Max Wittmann
0 minutes 36 seconds0:36
Max Wittmann 0 minutes 36 seconds
Well, for a start, Bryan, is that the order types that Melbourne use, there's no reason why you can't use them now. Like, it's not division specific. Those setups are company-wide, so there's nothing stopping you using MAT or MTO now.
Max Wittmann 1 minute
The, because you know, as I said, the company wide, and I look at and I look at and I saw in the extract that I provided to you, Karen, when I did that SQL, the if I share my screen.
BF

Bryan Fu
1 minute 13 seconds1:13
Bryan Fu 1 minute 13 seconds
Yeah, please.
MW

Max Wittmann
1 minute 17 seconds1:17
Max Wittmann 1 minute 17 seconds
That was that SQL that I ran when we look at the, when I looked at.
Max Wittmann 1 minute 22 seconds
in the last two, since start of 2024.
BF

Bryan Fu
1 minute 27 seconds1:27
Bryan Fu 1 minute 27 seconds
Nee.
MW

Max Wittmann
1 minute 27 seconds1:27
Max Wittmann 1 minute 27 seconds
grouping it by division and order type. And you see in there that, as Bryan said, like that, in division L, those entries down the bottom here.
BF

Bryan Fu
1 minute 29 seconds1:29
Bryan Fu 1 minute 29 seconds
Yeah.
Karen Lewin 53 minutes 28 seconds
Yes.
MW
Max Wittmann
53 minutes 31 seconds53:31
Max Wittmann 53 minutes 31 seconds
You can see there's the invoice and there's the cash receipt or the payment or the cancel. And if I looked at that, you'd see that that's the tram code 10.

Karen Lewin
53 minutes 35 seconds53:35
Karen Lewin 53 minutes 35 seconds
Yes, yep.
MW
Max Wittmann
53 minutes 44 seconds53:44
Max Wittmann 53 minutes 44 seconds
See it anyway then.
Max Wittmann 53 minutes 49 seconds
It's the train code 10 and that cash receipt would be the train code 20. So you see that in the SQL behind there. So you normally when you if you're doing SQL inquiries, you group it by the.

Karen Lewin
53 minutes 54 seconds53:54
Karen Lewin 53 minutes 54 seconds
Yep.
MW
Max Wittmann
54 minutes 4 seconds54:04
Max Wittmann 54 minutes 4 seconds
pay a customer number, invoice number and invoice year and then you could see the ins and you may have multiple transactions for that one invoice.

Karen Lewin
54 minutes 14 seconds54:14
Karen Lewin 54 minutes 14 seconds
Yes, makes a lot of sense.
MW
Max Wittmann
54 minutes 16 seconds54:16
Max Wittmann 54 minutes 16 seconds
Because you could have, you could have the invoice being, you only have one Tranco 10, but you may have partial payments against it, so you might have multiple 20s.

Karen Lewin
54 minutes 26 seconds54:26
Karen Lewin 54 minutes 26 seconds
Makes perfect sense.
Karen Lewin 54 minutes 28 seconds
Just goes to show I've got absolutely...
MW
Max Wittmann
54 minutes 32 seconds54:32
Max Wittmann 54 minutes 32 seconds
Teh.

Karen Lewin
54 minutes 33 seconds54:33
Karen Lewin 54 minutes 33 seconds
Hot raw balls in my head that I didn't think of that. That's a much easier way of doing it.
MW
Max Wittmann
54 minutes 38 seconds54:38
Max Wittmann 54 minutes 38 seconds
Yeah.
Max Wittmann 54 minutes 40 seconds
So, yeah.

Karen Lewin
54 minutes 40 seconds54:40
Karen Lewin 54 minutes 40 seconds
It's good to brainstorm.
MW
Max Wittmann
54 minutes 42 seconds54:42
Max Wittmann 54 minutes 42 seconds
So you use that as a starting point, your FS ledge and FP ledge for the AR and the AP ledger. And if you need information at a lower level, let us know. And then on the AP side, in a similar fashion, the tran codes are 40 and 50.

Karen Lewin
54 minutes 46 seconds54:46
Karen Lewin 54 minutes 46 seconds
Yeah.
Karen Lewin 54 minutes 47 seconds
Yep.
Karen Lewin 54 minutes 50 seconds
Yep.
Karen Lewin 55 minutes
Okay, yep.
MW
Max Wittmann
55 minutes 1 second55:01
Max Wittmann 55 minutes 1 second
10 and 20 in AR or FS ledge and 40 and 50 in FP ledge.

Karen Lewin
55 minutes 3 seconds55:03
Karen Lewin 55 minutes 3 seconds
Yep, yep, yep.
Karen Lewin 55 minutes 7 seconds
Fantastic.
Karen Lewin 55 minutes 10 seconds
Yeah, okay, that sounds great. One last question.
Karen Lewin 55 minutes 15 seconds
Teh.
Karen Lewin 55 minutes 17 seconds
Um...
Karen Lewin 55 minutes 20 seconds
Uh...
Karen Lewin 55 minutes 26 seconds
Actually, I think I'll send it to you instead. I get a bit muddled with having spent enough time with, let me just share my screen.
Karen Lewin 55 minutes 41 seconds
Hoou.
Karen Lewin 55 minutes 45 seconds
With.
Karen Lewin 55 minutes 47 seconds
this output management. So there was someone, and I think it was at Christmas time, a new person came along and what was their request? They wanted, their mail wasn't working.
MW
Max Wittmann
55 minutes 50 seconds55:50
Max Wittmann 55 minutes 50 seconds
Mm.

Karen Lewin
56 minutes 3 seconds56:03
Karen Lewin 56 minutes 3 seconds
And they're in the warehouse, and...
Karen Lewin 56 minutes 7 seconds
I think this, this is the program. I think that...
Karen Lewin 56 minutes 12 seconds
I get to define where it goes to. So if I bring up that person, I don't understand why someone's put in, those emails don't even belong to that person. So I'd say something went wrong in the creation process. I've only just found this.
MW
Max Wittmann
56 minutes 25 seconds56:25
Max Wittmann 56 minutes 25 seconds
Mm.

Karen Lewin
56 minutes 29 seconds56:29
Karen Lewin 56 minutes 29 seconds
Um...
MW
Max Wittmann
56 minutes 33 seconds56:33
Max Wittmann 56 minutes 33 seconds
Yeah, so normally, like I'd say, yeah, is you compare it to compare these entries to a valid user, you know, like the same user, and then just be conscious of the division you're in, that's all. And obviously, media, yeah, the...

Karen Lewin
56 minutes 39 seconds56:39
Karen Lewin 56 minutes 39 seconds
Teh.
Karen Lewin 56 minutes 44 seconds
Yeah.
Karen Lewin 56 minutes 45 seconds
Yep.
Karen Lewin 56 minutes 47 seconds
Well, this is Johor Bahru, but I think this is the old warehouse person. So I think these delivery notes are going into the ether or whatever, or being bounced. Anyway, it just took me a while to get to M&S 205, that's all. But I'll see how I go.
MW
Max Wittmann
56 minutes 49 seconds56:49
Max Wittmann 56 minutes 49 seconds
Mm.
Max Wittmann 57 minutes 4 seconds
Nee.

Karen Lewin
57 minutes 6 seconds57:06
Karen Lewin 57 minutes 6 seconds
You may get this one across your desk if this doesn't work.
MW
Max Wittmann
57 minutes 9 seconds57:09
Max Wittmann 57 minutes 9 seconds
OK, let let let us know.

Karen Lewin
57 minutes 13 seconds57:13
Karen Lewin 57 minutes 13 seconds
And you can tell when I'm in, I've got another meeting shortly, I've got half an hour, but you can tell when I'm like just shoving things off my desk and sending to you. And I know I might do it at weird times a night. It doesn't mean it's urgent. It just, if it's something is urgent, I'll put it on the subject. It's just that when you can, if you can look at it,
Karen Lewin 57 minutes 34 seconds
That's of help.
MW
Max Wittmann
57 minutes 37 seconds57:37
Max Wittmann 57 minutes 37 seconds
Now, can we get you have to shoot it to us, and but anyway, if we need to reconvene on either on either the SQLs or on order types, give us a hoy. OK.

Karen Lewin
57 minutes 37 seconds57:37
Karen Lewin 57 minutes 37 seconds
Um...
Karen Lewin 57 minutes 47 seconds
Yeah, I will. Thank you so much. Thanks, Hector. Thanks, Max. Bye.
MW
Max Wittmann
57 minutes 49 seconds57:49
Max Wittmann 57 minutes 49 seconds
Okay, guys.
Max Wittmann 57 minutes 51 seconds
See you guys.

Karen Lewin
57 minutes 52 seconds57:52
Karen Lewin 57 minutes 52 seconds
Bye.
MW
Max Wittmann
57 minutes 53 seconds57:53
Max Wittmann 57 minutes 53 seconds
Bye.
HS
Hector Salazar
57 minutes 53 seconds57:53
Hector Salazar 57 minutes 53 seconds
Bye, Max. Bye, Karen.

