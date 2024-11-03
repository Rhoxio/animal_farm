# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Ideation

Idea is to set up a new rails project (primarily server logic) that shows how I like to build Rails applications and set up some of the more advanced data modeling and testing.

I think that starting with something already kind of set up will work better. Need to get boilerplate out of the way.

The idea is to add some crazy stuff that requires composition, advanced tests, error handling, and maybe API responses.

1. Model Setups and Clean Interfaces
2. Testing tips and tricks
3. Composition
4. Error handling
5. API design

## Branch Intent

`interfaces-1`  
meant to outline out base model for animal snd set up some tests  
the tests are meant to reflect general expectations - they don't dive deep yet

`interfaces-2`  
meant to show the conundrum and a potential design issue. animals might have different
hunger and thirst needs, so we need to abstract this out in one of two ways

1. We keep the thresholds of 100 for each and define calorie/thirst modifiers for each based on type logic in a factory/strategy
2. we make the hunger and thirst definitions for each dynamic and create a column for their modifiers

Actually, the right answer is a combination of both. We want the data to describe the Animal, not the other way around.
This will allow us to use composition more cleanly to make generalizations about animals.

What would be better? I am leaning toward setting up the `thirst_modifier` and `hunger_modifier` for each animal so we can set up a factory to handle each baseline creation.
That way, we can actually create based on a Factory and can more dynamically assign and create objects with edge cases using strategies
instead of static expectations.

I think that this helps drive the point home about how Animals don't have control over their creation since they are so varied,
but allows each of them the potential to be different than others based on their attribute values and not their base structure.

In the migration, I am intentionally leaving constraints out for the moment. We don't need a `CHECK` and other DBs don't support it (like SQLite)

For the Food, I am going to make it so they can be partially consumed. `utilization` seems fair.
Since you can't drink more water or eat more food, there will be a leftover. Something else
can still eat that leftover - half an apple is still part of an apple.

I WILL constrain this sine it's meant to represent a round percentage. This will be done with a validation.