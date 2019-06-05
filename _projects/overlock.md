---
title: Overlock
image: "/assets/images/overlock.png"
summary: >
    Overlock is an IoT debugging product which my team and I created at Zoetrope to address the difficulties of remote debugging IoT.
weight: 10
current: false
---

See [the Overlock site](https://overlock.io) for a snapshot of the customer facing site we built.

In a nut shell - Overlock was an error catching an debugging tool for distributed systems, particuarly IoT systems.

In circa October 2017, I had spent a few months scratching my head about different ways in which our expertise and IoT platform, when a completely different problem struck me - just how hard it is to debug IoT systems in production. This was something we knew all too well from several of our projects.

## The business problem
Even when testing in the lab is comprehensive and spans Unit, Integration and End-to-End, there's always another bug. Combine that with IoT where most of the complexity is not in the each individual component of the system, but the emergent behaviours (or system complexity if you prefer).


## The Overlock solution
Overlock was a tool built using our ZConnect system, with an Elastic search data store for exceptions. Over the course of 4 months, my team and I:

1. Built an MVP
2. Built a hardware demo
3. Took the demo to San Fransisco for an IoT tradeshow
4. Got front-page hackernews
5. Spoke with IoT engineers at companies such as Beko and Bosch

![Our stand](/assets/images/overlock_sf_show.jpg){: width="80%", height="auto"}
> Martin Rolph (right) and me showing off Overlock in San Francisco.

The unique aspects of the solutions over other logging/exception catching systems were:

1. Fetching of debug logs from associated systems - when a problem happened in one place, Overlock would fetch logs from other systems too. This was a novel aspect and we did complete the first stage of a patent for this.
2. Timeline display for devices. An IoT device is very different from a server when it comes to supporting that device over its lifetime. With Overlock we built a timeline view to allow seeing what state a device was in and had been in.
3. Logging of state data. Overlock provided a state store so that important variables could be kept up-to-date.
4. Reduced bandwidth - Overlock only sent logs when an issue was detected, which allowed developers to always log debug level logs, but they would only be sent to the server if there was an error.

## The product/market problems
Ultimately we built enough to get the conversations we needed and were able to use this to discover 2 major problems:

1. IoT companies really need debugging tools for embedded software - Embedded systems would need a massive amount of per project customisation.
2. The teams who support products (and would benefit from Overlock) are not the same teams which write the software - the software engineers who would need to buy and integrate Overlock would not see the benefit.

Both of these problems are not ones which we can solve. The former is a technology problem and the only solution I've been able to think of would involve a hardware based solution (meaning selling a module/chip which communicates to overlock). The later is a people problem - certainly not one which Overlock would be able to easily circumnavigate.

## Now
Overlock was never at a stage where we'd be able to open source it. As such, it's effectively moth-balled.

If you're looking for something like Overlock, the nearest thing is [Sentry](https://sentry.io), however sentry does not have any tools for distributed issues at present.

