---
title: Making subscriptions for consumables work
date: 2019-07-25 09:00:00 Z
image: '/assets/images/generic.jpg'
---

## Keeping coffee in the cupboard
A domestic frustration of many ages has been running out of everyday items when you need them. Milk, bread, Shampoo, coffee, toilet roll.

A domestic frustration many of the "Amazon prime generation" (and as we all know, the prime-age immediately follows the space-age) is that you want things to arrive when you need them, ideally without having to think about it and without having to stock-pile and without a gap.

One thing which we could never simplify was coffee. We consumed about 1Kg/week; however, that's an average over about 3 months. In reality, if our biggest coffee drinker were out of the office for a while, we'd consume about a third less. We were quite in to extract coffee, and we had a fortnightly subscription for 2kg.

At one point we had about 5Kg of unopened coffee in the cupboard.

At another point, we had no coffee and had to go and get some cheap wizz from the corner shop.

More recently, I've been managing the same balancing act for my own coffee supply. There has to be a better way.

In addition to variable usage, there is a problem with most subscriptions that they have to be either weekly, fortnightly or monthly - which is not granular enough. It normally takes me 5 or 6 days to get through 250g of coffee.


## What to do
The tricky thing in this situation is not having the thought "Oh we need more coffee" whilst you're making coffee, as much as actually sitting down and going through the online checkout.

You can think of the need to buy coffee as a signal firing. With the current model, the signal is from a timer. I think it might be better if the signal is from the consumer, but with low enough friction that they can order without breaking their flow.

![Ordering coffee](/assets/images/subscriptions.png)

The left-hand image shows the repeating calendar type ordering, and the right-hand side shows on-demand ordering. The green line shows my experience of what happens to the amount of coffee you have in stock. The hatched blue is where you're away or have too much coffee hanging around.

I read up a few months ago that [Amazon's somewhat controversial patents on "One-click" technology](https://en.wikipedia.org/wiki/1-Click#Patent) had come to an end some time ago.

I decided to make a really simple prototype which would allow me to make an order when I'm making coffee and without requiring anything more than a click.

## Extract Extract
Using a UI testing automation framework, [cypress](https://cypress.io), I created [extract-extract](https://github.com/benhowes/extract-extract).

![Auto coffee order](https://github.com/benhowes/extract-extract/raw/master/img/overview.png)

What it does is:
1. Login
2. Add a specified coffee and grind to the basket
3. Checkout with saved card details

I've set up a command-line command `extractcoffeeorder` which, in turn, is configured to run from a button click on my phone homescreen. I've used it a few times now, and it's really flexible and easy to keep on top of in comparison to when I had a weekly subscription.

When I go on holiday, I will simply not click the button. When I have someone coming to stay, I just click the button more often.

## What's needed to make this a business
Of course, having an SSH client on your phone and configuring with a JSON file is not going to fly for a mass market, not to mention the legals etc of just using web scraping techniques on a larger scale, storing passwords and all that horrible stuff. Suffice to say; the current architecture is not suitable for anything other than giving me something to demonstrate my point in this post.

The way I'd see this working on a larger scale is as follows:
1. Make a template of an App, probably with react native or something. That App is built around the central idea of having a home page with a big button to order the coffee, and not a lot else.
2. Get a handful of coffee companies interested in using this to provide a better experience for their customers
3. Customise the app for each with branding and some integration with their woocommerce/shopify or whatever they use.
4. Trial with customers
5. Run as a business, either with a tiered fixed monthly fee, or some per sale commission on One-tap purchases.

You can remove a stakeholder from the loop by actually buying and shipping the coffee as an intermediately, which is what [bottomless](https://www.bottomless.com/) seem to be going for. For me, I don't want to start a business where you end up with a picking and packing operation.

## Why has this not already been done
I think there are two avenues to this:
1. Calendar-based subscriptions provide really predictable demand and revenue, which is probably perceived as being a lot better for the business
2. It's easier! Both technically and contractually.
3. Most of the companies producing really high-quality goods which are not sold through Amazon can't take on building something like this. The cost would need to be amortised over many many vendors for it to make financial sense.

## What else does this apply to
I've talked a lot about coffee, but there is no reason this doesn't apply to many other consumables:
- Shampoo - My wife buys a fancy shampoo which she has to order online
- Tights - I don't know a lot about this, but from what I can tell, they're eternally laddering and need replacing
- Water/air filters
- Supplements
- Tea (e.g. teapigs)
- Meal replacements, e.g. Huel.

## Why am I not doing it
I might look at this more in the future - my main reason for not dealing in it more at the moment is multiple stakeholders to get involved. The idea needs selling both to the consumer, and on the other side, it needs selling to the companies who run the show.

### Notes

**Dash buttons**: No article in this space would be complete without Amazon dash buttons being mentioned. They came out at the peak of the hype-cycle around IoT and having used a few for office staples when I was running an office; they really did come in handy as a way for anyone to help replenish supplies. They've been cancelled more recently - I've not really dug into the reasoning, but for my home, I both don't want to buy everything from Amazon, and I also don't what a hundred batteries to change.
