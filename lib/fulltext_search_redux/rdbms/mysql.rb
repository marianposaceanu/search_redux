module FulltextSearchRedux
  class Mysql
    def self.compatible_search(query)
      ->(obj) { obj.where("title like :q or content like :q", q: "%#{query}%") }
    end
  end
end
