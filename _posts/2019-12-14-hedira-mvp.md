---
title: The 4 week MVP for Hedira
date: 2019-12-14 09:00:00 Z
---

In the past 4 weeks, I've been working to take an idea and develop it into something good enough to help us prove our startup's fundamental assumptions.

**This MVP is for [Hedira, an app which helps people keep their house plants alive](https://hedira.io) with timely reminders to water their plants.**

On this project, I was the only developer, however, my co-founder [Jess](https://twitter.com/JSaumarez) had already done an enormous amount of leg work in terms of getting wireframes mocked up, and knowing enough about botany to create the dataset we needed.

I've done short MVP builds several times before at this point, and I wanted to share the approach I'm taking in the hope that someone else will find it useful also!

![Hedira splash screen](/assets/images/hedira-splash.png){:width="200px" style="display:block; margin: 0 auto;"}

# My tips for making an MVP fast

## 0. Have a deadline
For a Software/SaaS product; you're going to need to carve out somewhere between 3-6 weeks when you can spend at least most of your time on creating the MVP. Other industries may vary - e.g. anything with hardware is going to need an order of magnitude more time (at least).

It's not an artificial deadline once you've had to move mountains to be able to spend time on the project.

I was able to carve out 4 weeks, and I had really hoped that I'd only need 3 of those weeks. I did, of course, end up using all 4!

## 1. Work with tools you already have/know
This is summarised well as ["Use boring technology"](https://mcfunley.com/choose-boring-technology), i.e. the best tools to use are the ones you already have. That means don't use your MVP build to try and learn a new language or tool if possible.

In my case, the stack looks like this:
- Heroku - Almost 0 "devops", the potential future cost does not concern me. We can migrate if we need to.
- Django - Python is my primary language, I've been contracting in the Django space for ~18 months
- GraphQL - this probably does qualify as shiny, but I'd used it several times before and found the benefits of near-enough automatic IDE (with graphiQL) and type safety was well worth it for me.
- React Native - I've used React on the web a lot and worked on React Native apps in the past.
- [Expo](https://expo.io/) - if you're building a react native MVP, you need a good reason not to use this, it kept feedback loops tight and provides a great development experience.

## 2. Be very clear about what you're setting out to prove
My co-founder and I had agreed that the first and foremost assumption to test was that people would find an app helpful for keeping their plants correctly watered.

Ideally, we'd measure the number of dead plants v.s. alive plants. On the scale of our MVP timeline, this was going to be too slow and too difficult to measure. As a proxy, we'd decided to use the number of care instructions our users follow as the metric for how helpful they are finding the app.

We were able to go into building the app knowing both what we wanted users to be able to do, and what metrics were paramount to proving the concept.

This will help you simplify what you're building and help prevent accidentally building orthogonal features!

## 3. Make something simple work as soon as possible
In the timeline below, you'll see that in the first week, I was able to have a very basic version of the main bits of the app working. Forms weren't validated properly, it looked terrible, and it had none of the frills (like being able to reset your password), but it was a framework to build out.

I believe that this point is so important, especially when combined with the previous because it means that when you get that far, you're in a position to make a prioritised list of things to add to the product before your deadline.

Another factor when you've set yourself a deadline is to know when to stop adding new features, or at least slow down on the new features whilst you get existing features polished. I stopped on new features before the end of the 3rd week to allow enough time to do all the testing.

Not only that, but it permits my 6th point on this list.

## 4. Mainly integration test
There's a moderately famous tweet which sums this up:
> [_"Write tests. Not too many. Mostly integration."_](https://twitter.com/rauchg/status/807626710350839808)

It's been [expanded on further here](https://kentcdodds.com/blog/write-tests), which when taken to heart can really help you only spending time on tests which matter.

In my case, the back end has a few areas which I wanted to test with unit tests: One of them aggregates some care actions we want the user to complete in to a single string in order that we can create a push notification, Another ensures that push notifications are not triggered too often for the same user (obviously that would be bad!), and finally part of the code which deals with adjusting watering cycles based on the seasons. This amounts to about 20 tests if you include all the parameterised versions.

For The remaining test, they are split over:
- Integration tests - All graphQL, with the database in the loop. Performance isn't a problem at this scale
- End-to-end tests with Appium - i.e. the thing you care about most is that the user can do all the things they want to.

The appium e2e tests ended up being very painful to get right, but I have persevered to get the onboarding tested since that's paramount. I ran out of time, but if I had more, I'd also test completing plant tasks. I do hope to do that next week.

## 5. Follow the path of least resistance with UI/design
I tried, and mostly succeeded, in not getting too involved with going off the beaten track with UI. If you can mostly stick to using a standard kit (I used react native elements with a few Theme overrides), it helps you just focus on the core functionality of the app.

One example of somewhere I definitely went wrong here is trying to use a slider widget to select the light level when a radio button was perfectly good. The result was a slider with only 3 positions and whilst it made sense to me, I quickly got feedback that it sucked. I reverted to radio buttons and had written off a few hours.

## 6. Get feedback throughout
Both through sending screenshots and a link to the Expo app to Jess & a couple of techie friends (Thanks to Pedro & Rich!) I was lucky enough to get candid feedback very early often, which really helped to ensure that the things I had built were useful.

In some cases, I even sent over mockups which were photos of quick sketches. This really helped to make sure that I wasn't spending too much time on things we were going to have to throw away.

## 7. The "You should be embarrassed of your MVP" thing
It's probably better to say that you will be embarrassed by looking back mistakes you made in the MVP because of what you learned about your users from the MVP.

In this case, I'm slightly embarrassed about how few features are in the MVP, however, as per 2, we've put just enough in the app to test that key assumption and nothing else. I'm proud of how well that core feature works.

[There's a post](https://medium.com/@alearningaday/dont-rush-to-be-embarrassed-by-the-first-version-of-your-product-656839d068b) which shares my opinion on this.

# MVP build Timeline

To give those tips a bit more context, here's roughly what the timeline of this app build looked like over the past few weeks.

## Before commencing the 4 week build
We knew when I was going to have time for about a month before, so we did a few bits of preparation ahead of time.

-   Finished a software development contract, went on holiday
-   Some time thinking about the app etc - I had some plane travel and holiday time which was great for this.
-   Minor work on django server, in particular discussing and modeling how we wanted the app to behave.
-   Co-founder created some app wireframes and tested them with friends

# The build

## Week 1 (18th November)

- Built out app platform enough that the plant state machines worked, cron task. Only with plant watering though.
- Added graphQL interface to the server, JWT auth etc
- Heroku hosting setup (staging environment)
- Started on app - focused being able to complete plant care actions first
- Added plant onboarding to app

**_Features at the end of the week:_ Completing a task in the app, getting push notifications. Ability to complete the most basic signup.**

## Week 2 (25th November)

- Made a priority ordered to do list of high/medium/low priority tasks, where only High priority were essential.
- Added account settings screens
- Added event tracking (segment)
- Added plant misting and fertiliser, along the same lines as watering.
- Seasonality of plant care (modifies care instructions based on seasons).

**_Features at the end of the week:_ Added support for misting and feeding care instructions, account management, analytics**

## Week 3 (2nd December)

- Adding mailing list sync
- Lost password flows etc
- Heroku production setup, email providers
- Created play store account, uploaded test app. Eventually waited 4 days for that to publish
- Reviewed all of app content and text with co-founder
- Created spreadsheet for co-founder to enter botanical data.

**_Features at the end of the week:_ onboarding with room conditions, Asking the user where they bought the plant, Ability to edit the plant, Proper control over push notifications.**

## Week 4 (9th December)

- Tweaks, bug fixes, setting up appium tests. Checking form validation.
- (Non MVP build) Meetings about invesment and work on pitch deck
- Added app feedback mechanism (embedded Canny.io)
- Build for iOS, testing on iOS and creating apple developer account.
- Imported real data.
- Got private beta feedback from 5 friends.
- Submitted to app stores Wednesday, released on Friday AM.

**_Features at the end of the week:_ Feedback screen. Dozens of minor improvements.**

# Conclusion
It's been a really intense 4 weeks of alternating between sleep and solving problems, and the first time in a very very long time that I've been able to "clear the decks" in order to focus on a single problem for a while. It's been great and I have to say I'm really pleased with having been able to get it done!

From here, we're promoting the MVP to people who we think will benefit from an app which helps them provide the right care at the right time.

If you'd like to give it a try, be my guest! I'll update this when it's no longer the MVP so as to not give an unrealistic impression.

[![iOS](/assets/images/download-on-the-app-store.png){:width="150px"}](https://apps.apple.com/us/app/hedira-plants-are-for-life/id1491158464) [![Android](/assets/images/google-play-badge.png){:width="150px"}](https://play.google.com/store/apps/details?id=io.hedira.care)

Some screenshots:

![Hedira plant action](/assets/images/hedira-plant-action.png){:width="250px"}
![Hedira plant info](/assets/images/hedira-plant-info.png){:width="250px"}
