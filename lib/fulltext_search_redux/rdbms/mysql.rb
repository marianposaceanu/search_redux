module FulltextSearchRedux
  module Mysql
    def compatible_search(query)
      ["title like :q or content like :q", q: "%#{query}%"]
    end
  end
end
