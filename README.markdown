WriteIdeally
============

Background
----------

WriteIdeally is a pet project of
[@sudojosh](http://www.joshmcarthur.com) and
[@nz_gemma](http://twitter.com/nz_gemma), designed to provide a simple
application for managing writing ideas online. It's very basic,
providing more or less a simple CRUD functionality for ideas, along with
a full-text search, as it's purpose was to give some
background into Rails development with a simple and relevant example.
The application is hosted for free on [Heroku](http://heroku.com), at
the URL [http://writeideally.com](http://writeideally.com).

Installation
------------

* Clone the source code:
  `git clone git@github.com:joshmcarthur/WriteIdeally.git`  
  `cd WriteIdeally`
* Run Bundler to install dependencies
  `bundle install`
* Add a database.yml file to the project with the contents:
  ```
    development:   
      adapter: sqlite3  
      database: db/writeideally_development.db.sqlite3
  ```
* Run the database migrations
  `rake db:migrate`

Following these steps, you should be able to run `rails server`, and
visit [http://localhost:3000](http://localhost:3000) to see WriteIdeally
in action. I welcome any contributions.

License
-------

As this project is a personal one, and is not-for-profit and isn't much
anyway, I'm retaining my standard MIT license. This type of license
allows fairly unlimited use of this source code, so feel free to use in
whichever way you see fit.

Author
------

* Josh McArthur - [Twitter](http://twitter.com/sudojosh),
  [Website](http://www.joshmcarthur.com)
* Gemma Brooks - [Twitter](http://twitter.com/nz_gemma)

