---
title: Stalemate
image: "/assets/images/stalemate.png"
summary: 'Stalemate is a PR dashboard for your Github organisations. See CI, Reviews and mergability at a glance.'
weight: 0
current: true
---

[Stalemate](https://stalemate.io) is a project built out of a couple of problems I've had and witnessed whilst being a freelancer on software teams.

1) Developers forget to review other peoples work - this causes lots of slack messages chasing up
2) Developers have a tough time keeping track of failing CI, reviews and conflict status on their own work - especially over many projects
3) Experiments or WIP pull requests are often forgotten about entirely

Stalemate provides a simple, minimal config dashboarding tool which is for desktop and TV viewing.

I've built it with [Richard](http://rfwebb.com/) who was previously my co-founder at Zoetrope Labs.

It's probably had around 100 hours of work at this stage and is not currently commercialised. In future, we may charge a small amount for it through github marketplace.

Over 50 companies are currently using Stalemate and a product hunt (and/or indie hackers) post is on the way!

It looks like this:

![Stalemate example dashboard](/assets/images/stalemate.png)

We've made it really easy to install by using the github apps architecture. That means we get a webhook for the install from github, github oauth for users and through granular permissions in github apps, only have access to the exact data we need.

The project is ongoing and we've had some really great feedback from users including "This is exactly what we've been looking for" :)
