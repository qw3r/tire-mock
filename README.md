tire-mock
=========

Provides simple HTTP::Client to mock ElasticSearch responses. Especially useful in integration tests.

Usage
-----
Add to you Gemfile's test group
```ruby
gem 'tire-mock', group: :test, git: "https://github.com/qw3r/tire-mock.git"
```

Let's say you have a Tire-ized (with mapping and/or `to_indexed_json` definition) `Article` model, and you want to get
the first article as search result. To accomplish that use:
```ruby
Tire::Mock.set Article.first
```
Use
```ruby
Tire::Mock.reset
```
to get an empty OK.

It's possible to 'mock' different models (```Tire::Mock.set [user, article, post, note...]```)


TODO ideas
----------

* "record" the last created/updates document to use as response
* make "mocking" of  highlighs/facets more simpler, easier
* etc.

