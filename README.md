# Search redux

A simple way to add full text search to your Rails models. Currently supported RDBMs are [Postgres](http://www.postgresql.org/docs/8.3/static/textsearch.html) anda simple fallback for other RDBMs (e.g. Mysql).

## Requirements

Search redux requires at least Ruby >= 1.9.2 and Rails >= 3.0.0 and Postgres >= 9.2.

## Installation

Include the gem in your Gemfile:

```ruby
gem 'search_redux'
```

## Quick start

In your model call the `act_as_searchable` with the columns that you want to search and the column for rank-based ordering.

```ruby
class MyModel
  act_as_searchable :columns => %w(title content), :rank => 'title'
end
```

You can easily search via the `text_search` method.

```ruby
class MyController
  def index
    an_article = MyModel.text_search 'query phrase'
  end
end
```
