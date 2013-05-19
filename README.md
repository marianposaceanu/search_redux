# Full text search redux

The current version is just a code extract of a simple text search logic using  Postgres [functionality](http://www.postgresql.org/docs/8.3/static/textsearch.html) and a simple fallback for other RDBMs (e.g. Mysql)

For now the usage is limited, it expects a `title` and a `content` column.

## Installation

Include the gem in your Gemfile:

```ruby
gem 'search_redux'
```

## Quick start

```ruby
class MyModel
  act_as_searchable
end

class MyController
  def index
    an_article = MyModel.text_search 'query phrase'
  end
end
```
