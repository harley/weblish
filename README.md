# Getting Started

1. Clone the repo (`git clone harleyttd/weblish` if you use hub)
2. Copy config/database.example.yml to config/database.yml and set up the config appropriately. Please use PostgreSQL locally so it matches what we use on Heroku. We need PostgreSQL's full text search for now.
3. Copy config/application.example.yml to config/application.yml and set up your local configs appropriately ()
3. See if 'rake db:create' succeeds.
4. See if `rails s` works and browsing to `localhost:3000` works
5. Run `rake db:seed_fu` to seed local development db with users, topics and more later.
6. Run `rails r db/load_papers` to seed papers from `papers` folder.
7. Run `bundle exec rspec spec` to see if all existing tests pass.

Optional:

8. Set up pow.cx so you can access the project at something like `weblish.dev`
9. Set up unicorn server to use locally (I'm not even doing it yet)

# Notes

1. We use Rails 4 and deploy to heroku. Contact Harley for Heroku access and deployment instructions.
2. We use [Figaro](http://github.com/laserlemon/figaro) to conveniently manage ENV variables. We use ENV variables for config to keep sensitive info off github.
3 .I may forgot a few things. Feel free to ask me anything and add any useful steps or notes here.
