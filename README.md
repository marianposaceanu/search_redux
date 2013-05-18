# Full text search redux

The current version is just a code extraction of a simple text search using especially Postgres functionality.

For now the usage is limited, it expects a title and a content column.

# Installation 

Include the gem in your Gemfile:

```ruby
gem 'fulltext_search_redux'
```

# Quick start

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
