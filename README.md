----
### NOTE: This project was a quick prototype and is no longer maintained. Feel free to get in touch if you want to talk about it though.
----

## Getting Started

1. Clone the repo (just `git clone harleyttd/weblish` with `hub`)
2. Copy config/database.example.yml to config/database.yml and set up the config appropriately. Please use PostgreSQL locally so it matches what we use on Heroku. We need PostgreSQL's full text search for now.
3. Copy config/application.example.yml to config/application.yml and set up your local configs appropriately
3. See if 'rake db:create' succeeds.
4. See if `rails s` works and browsing to `localhost:3000` works
5. Run `rake db:seed_fu` to seed local development db with users, topics and more later.
6. Run `rails r db/load_papers` to seed papers from `papers` folder.
7. Run `bundle exec rspec spec` to see if all existing tests pass.

Optional:

8. Set up pow.cx so you can access the project at something like `weblish.dev`
9. Set up unicorn server to use locally

## Notes

1. We use Rails 4 and deploy to Heroku
2. We use [Figaro](http://github.com/laserlemon/figaro) to conveniently manage ENV variables. We use ENV variables for config to keep sensitive info off github.
3 I may forgot a few things. Feel free to ask me anything and add any useful steps or notes here.
