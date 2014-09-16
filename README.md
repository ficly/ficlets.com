# Ficlets.com

Ficlets was a micro-fiction writing community site built and launched in 2007 by a small team working at AOL. The site was subsequently shut down by AOL in January 2009. Before the site was taken offline, we managed to rescue most of the content and established the Ficlets Memorial (originally available at [http://ficlets.ficly.com/](http://ficlets.ficly.com/)). You can read more about Ficlets [on Wikipedia](http://en.m.wikipedia.org/wiki/Ficlets).

As we wound down its successor, [Ficly](http://ficly.com/), in September 2014, we took the opportunity to rebuild Ficlets as a read-only, standalone site.


## Prerequisites

- Ruby 2.1.1
- Bundler (`gem install bundler`)
- MySQL (`brew install mysql`)


## Setup

1. If you use [rbenv](https://github.com/sstephenson/rbenv), set the local Ruby version to 2.1.1: `rbenv local 2.1.1`
2. Install the project's gems with: `bundle install`
3. Create a database configuration file: `cp config/database.yml{.example,}`
4. Update the configuration file created in step 3 with the appropriate values for your MySQL server.
5. Create and migrate the database: `rake db:create db:migrate`
6. Seed the database with authors, stories, and comments: `rake db:seed`
7. Start up the app: `shotgun`
8. Visit [http://localhost:9393](http://localhost:9393) in your browser of choice


## Acknowledgements

Ficlets was always a labor of love for everyone involved. AOL provided us an opportunity to create something meaningful and we ran with it. The community that evolved around Ficlets (and Ficly) is one of the most amazing, engaged, creative groups of people we've ever encountered and we're eternally grateful for their support.

- [Jason](https://github.com/jgarber623), September 16, 2014


## License

This site's content and its source code are licensed under a [Creative Commons Attribution-Share Alike 2.5 license](http://creativecommons.org/licenses/by-sa/2.5/).