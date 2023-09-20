---
controls: false
theme: black
---

# Mindset of successful Automation

20th September, 2023
by Benjamin Meixner

---
# Get The Slides

[github.com/maixnor/talks](https://github.com/maixnor/talks)

notes:
Everything you see in this talk from the script to the images are part of a markdown document available on github under a public domain license.

---
# Automation?

notes:
Automation is everywhere. 
Please everyone put your hand up who has interacted with automation before.
Now I would like everyone to sit down again that has had a problem with bad automation.
Why is everyone sitting? It doesn't have to be like that

---
![[coffee.jpg]]
---
# Coffee
- Roast
- Granularity
- Amount
- Water Pressure
- Duration

---
# Coffee...
- Milk?
- Sugar?
- Foam?

---
# Your Mindset

of successful automation

notes:
There is no mindset to successful automation. It just happens

---
![[coffee_machine.png|600x600]]

notes: 
just empty. the mindset behind successful automation is none

---
## But How?

- clear triggers
- simple states and results
- reliable notification

---
## Back to Coffee

![[coffee_machine.png|400x400]]

notes:
When you go to grab a coffee you don't think about all the steps involved in making the coffee. You just pick your favourite one and go with it.

---
![[coffeeshop.png|600]]

notes:
what about a coffee shop? let's see if this too is an automation. you order your coffee and after a short wait you receive your drink. Automation does not necessary mean digital processes. It may also involve people. The important thing is that you yourself are not involved

---

enough about coffee

---
# "Automation"


notes:
now to illustrate exactly what I mean we will turn to an example. Coffe

---
# Mindset

of successful automation

notes:
Now let me introduce you to the mindset you have

---

notes: 
just empty. the mindset behind successful automation is none. there is nothing to think about

---
# Details

notes:
let me introduce you to the first automation

---

>If you don't understand the details of your business you are going to fail. 

&mdash; Jeff Bezos

notes:
The ability to examine details closely is a vital part of many professions. It's the seemingly simple things in life that turn into highly complex processes. Sometimes we tend to get stuck on details and lose the bigger picture. That is where the first automation comes in. Detail automation.

---

![[automation_initial code.png]]

notes:
we want to compile this rust function. Don't worry, you don't need to understand this code.
Now that the code is done we want to compile it. So let's hit compile and watch our program come to life.

---

![[automation_cleaned_up_compiler_error.png]]

notes:
Oh no. There is an error. But the error is telling es right away where the problem lies. It seems to be on line 9 and it even says right there by the help what we should do to make the code work. We overlooked a small detail, a semicolon instead of a comma. 

---
![[automation_fixed.png]]

notes: 
now that we have fixed our mistake it compiles and we can deliver the product. The compiler made sure that our code is valid and that all the details are correct.

---
>Detail Automation makes sure the details are correct.

notes:
detail automation is a security mechanism. It let's us know if all the fine details are just the way they should be.

---
# Mental Overhead

notes: 
Mental Overhead describes all the things you have to keep track of while doing a specific task. The more mental overhead there is, the more time and effort may go into a task, especially people that are not familiar with the tasks are overwhelmed.

---
# the *Task* is simple
- but...
- but...
- but...
- but,..
- but...
- but...

---
### Reduce Mental Overhead

---
# TDN

| `task`                   | `solution`           |
| ------------------ | ---------- |
| product validation | Tests      |
| file handling      | Deployment |
| notifying people   | Notification   |

notes:
The TDN Framework
Tests
Deployment
Notification

---

# <font color="#3EA0E3">Tests</font>
# Deployment
# Notification

---
# Why even test?

---
Humans

notes:
Humans are ... well ... humans
Humans make mistakes all the time, we need to protect us from these mistakes

---
# Protection
---
### Good Cop, Neutral Cop, Bad Cop

notes:
Tests can be good, but tests can also be useless ore even bad

---
# Neutral Tests
- reliable

notes:
tests that are just reliable will be used occasionally to verify the product at key points - like deployments - but won't be used frequently during development

---
# Good Tests
1) fast
2) reliable
3) obvious

notes:
reliable: they should always detect if something is bad. they may not find all the bad things - that would require all bad cases to be known. impossible
fast: meaningful insights should be there within 3 seconds
obvious: it should be obvious if a test was successful or not. just print a preferrably colorful "Successfull" or "Failed". you should be able to gain insight with just a single look. 


---

# Fast

> The probability of bounce increases <font color="#3EA0E3">**32%**</font> as page load time goes from <font color="#3EA0E3">**1**</font> second to <font color="#3EA0E3">**3**</font> seconds.

&mdash; Google/SOASTA Research, 2017.

notes: 
a bounce is a client leaving the site before content is consumed - an empty website hit
this insight was generated in 2017... do you think people have grown more patient since then or has this percentage increased since 2017?
source:
https://www.thinkwithgoogle.com/marketing-strategies/app-and-mobile/page-load-time-statistics/share/

---
# Obvious
<font color="red">Red</font> vs. <font color=lightgreen>Green</font>

notes:
a test should only have 2 results - red and green
for a collection of tests - a test suite - should also only be 2 results - red and green
one test fails -> everything fails
the result should be instantly visible, there may not be a list I have to scan for anything suspicious, that is a log, not a test

---
# Gherkin Syntax
![[Pasted image 20230920042425.png]]

notes:
gherkin allows to define test requirements in spoken language
this enables everyone on a team - coder or not - to understand the parameters of a given test
https://cucumber.io is a good place to start
https://specflow.org is a great .net tool

---

# Tests
# <font color="#3EA0E3">Deployment</font>
# Notification

---
# Packaging

notes:
packaging is the process of gathering all the things I need to deploy. a package is a standalone version that can be deployed anytime.

---
# Deployment

- one invocation
- 2 results

notes:
The best deployment is one that happens automatically. I have set it up that my deployment is as simple as possible

---

`$ git push`

notes:
my deployments always lives where my code lives - in source control. Whenever my code changes I run the deployment

---
# 0
---
# Staging
---
# Tests
# Deployment
# <font color="#3EA0E3">Notification</font>

---
# Channels

- Instant Message
- Email
- UI Element

notes:
notifications come in many shapes. The goal is to let people know people what happened. Sending a teams message via webhook could not be easier. as long as your automation environment has internet access you are golden.
conveniently instant messages and emails usually include push notifications on the receiver side, UI Elements usually do not come with this feature.

---
# What to notify?

- just failures
- complete success
- partial success
- all activity


---
_the people shall choose_

notes:
I like to let people choose what they want to receive, therefore they are not spammed with useless information while also giving them the control the receive more information if they feel the need to
Github e.g. has a great system for that where you can choose how much you want to be notified and in Teams you could separate it into different channels and let people just mute the respective channels. Important: label stuff that is not useful to most people with stuff like `debug` or `muteme` so nobody feels the need to check there.

---
# the *Task* is simple
- but Tests
- but Packaging
- but...
- but,..
- but Deployment
- but Notification

---
# the *Task* is simple
- ~~but Tests~~
- ~~but Packaging~~
- but...
- but,..
- ~~but Deployment~~
- ~~but Notification~~

notes: 
now that we have eliminated all the testing and deployment and letting people know that stuff is done we can reduce our mental overhead and focus on the important stuff

---
# the Task *is* simple
- but...
- but,..

notes:
oh no, can you see it?
what is that comma doing in there, that's not supposed to be there. 

---
# the Task *is* simple
- but...
- but<font color="#3EA0E3">,</font>..

notes:
It was here all the time, I shall prove it to you by going back in the presentation 
** proceeds to go back in presentation live **

---
# We tried
... but it did not work

---
# SIT 

- Simple
- Intuitive
- Trustworthy

---
# Complexity

notes:
complexity can be very challenging
opportunity for great success but also a grave danger when not dealt with correctly

---
![[lego_wall-e.png|600x600]]
notes:
by splitting larger programs or tasks into smaller pieces the individual pieces become simpler. The complexity is moved into the interaction between these simpler pieces.
just like lego. The individual pieces are simple (like joints or tracks in this example) but Wall-E is constructed from many different parts
reusability -> shoulder and neck might be the same lego bricks

---
### the best code ...

notes:
is code that is not written
Delete everything that is not needed 
remove features from your tools
example: do not implement directory searching for CLI tools -> use tools like `GNU parallel` together with `find` to apply the same process to many files
also: remove faulty code -> this forces the implementation of newer and better solutions

---
# KISS
Keep it simple, stupid

notes:
keep everything as simple as possible. Concepts, Implementations, Workflows, Documentation. The less there is the less can break.

---

> Do one thing. Do it well.

&mdash; Unix Philosophy

---

## ~~Complexity~~
## Simplicity

---
# Documentation

---
> Documentation is a love letter that you write to your future self.

&mdash; Damian Conway

notes:
documentation has just one purpose help people that don't know to know
choose the most convenient option

---
- --help
- README.md
- Swagger
- Gherkin Tests
- Knowledge Base

notes:
pick your poison
there are many possibilities for great documentation, not everything needs to end up in e.g. confluence

---
> Incorrect documentation is often worse than no documentation.

&mdash; Bertrand Meyer

notes:
documentation can be dangerous
faulty or lacky information can be more dangerous than no information
documentation needs to be kept correct, many projects struggle with this part

---
## ~~Documentation~~ 
## Intuition

---
# Flaky

notes:
after splitting large programs and automations and removing some features from programs 
get rid of flakyness -> false posititives, false negatives
only goal: make it reliable -> more reliable than yourself

---
### Repeat

notes:
use your automations often. Then you will naturally encounter edge cases and notice reliability issues

---
### Honesty

notes:
communicate clearly when things are not ready for production
when you just want to collect usage data from your tool then please advertise this 
also declare parts as experimental
this is the best way to support an experimenting mindset with yourself and the people around you

---

> I'm not upset that you lied to me, I'm upset that from now on I can't believe you.

&mdash; Friedrich Nietzsche

notes:
you need to be able to trust in your systems. Once you start second-guessing your failsafes, your tests and your automations are not good for you. Remove them before they drive you and the people around you mad. 

---
## ~~Flakyness~~ 
## Trust
---
# Configuration Backup

notes:
copy all server configurations and network configurations and credentials to a USB drive. replace USB drive once every week. A great and cheap strategy to mitigate the damage in case of a ransomware attack.

---
### Package

notes:
gather all information and configuration about a server or network device into one central file. Depending on operating system or workloads these packaging processes might be different

---
### Transfer

notes:
Getting all the files from all the servers into one central collection. this does not have to be the server or computer which will have the USB drive. Also here you would start to organise into different folders or filenames based on the host of the configuration

---
### Organise

notes:
next up in the process is which hosts to collect configurations from. This should be done using parameters which are easy to replace. The data source of this list might be from a system itself, like a query against a datacenter software like VM Ware

---
### Move

notes:
one more technical step: getting the data to the USB drive. This should be no more than a zip, transfer, and move away. 

---

### Notification

notes:
last in the process is to think about if a server is unreachable or did not package the configuration correctly. What if another operation did not finish successfully or ran into a timeout. How do you want to handle the USB drive replacement. Should there be a weekly email to the IT department or yet another calendar event. Or is Monday the designated day of USB drive replacement? So many options...
Just think of something and communicate it to everyone involved.

---
# Wrap it up 
- tests, deployments and notifications
- remove mental overhead
- simple, intuitive, trustworthy

notes:
TDN is important
the less to think about the better
SIT Framework to build great tools

---
# Mindset 
# ==
# Nothing

---
![[automation_meme.jpg]]


