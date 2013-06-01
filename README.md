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

## License (MIT) 

Copyright (c) 2013 Marian Posaceanu 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

