require 'fulltext_search_redux/version'
require 'fulltext_search_redux/errors'
require 'fulltext_search_redux/helpers'
require 'fulltext_search_redux/rdbms/mysql.rb'
require 'fulltext_search_redux/rdbms/postgres.rb'

require 'fulltext_search_redux/railtie'

module FulltextSearchRedux
  extend Helpers

  def self.hi
    puts "Hello world!"
  end

  module ClassMethods
    def text_search(query)
      select_best_query_stategy(db_adapter, query)
    else
      scoped
    end
  end
end
