require 'search_redux/version'
require 'search_redux/errors'
require 'search_redux/helpers'
require 'search_redux/glue'
require 'search_redux/rdbms/mysql.rb'
require 'search_redux/rdbms/postgres.rb'

require 'search_redux/railtie'

module SearchRedux
  extend Helpers

  module ClassMethods
    def text_search(query)
      if query.present?
        adapter  = SearchRedux.db_adapter
        strategy = SearchRedux.select_best_query_strategy(adapter, query)

        strategy.call(self)
      else
        scoped
      end
    end
  end
end
