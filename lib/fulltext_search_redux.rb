require 'fulltext_search_redux/version'
require 'fulltext_search_redux/errors'
require 'fulltext_search_redux/helpers'
require 'fulltext_search_redux/glue'
require 'fulltext_search_redux/rdbms/mysql.rb'
require 'fulltext_search_redux/rdbms/postgres.rb'

require 'fulltext_search_redux/railtie'

module FulltextSearchRedux
  extend Helpers

  module ClassMethods
    def text_search(query)
      if query.present?
        adapter  = FulltextSearchRedux.db_adapter
        strategy = FulltextSearchRedux.select_best_query_strategy(adapter, query)

        strategy.call(self)
      else
        scoped
      end
    end
  end
end
