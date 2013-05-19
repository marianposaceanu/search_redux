require 'search_redux/version'
require 'search_redux/errors'
require 'search_redux/helpers'
require 'search_redux/glue'
require 'search_redux/searchable'
require 'search_redux/rdbms/mysql'
require 'search_redux/rdbms/postgres'

require 'search_redux/railtie'

module SearchRedux
  extend Helpers

  module ClassMethods
    def act_as_searchable(options = {})
      attr_accessor :searchable

      @searchable = SearchRedux::Searchable.new options
    end

    def text_search(query)
      raise(Errors::ActAsSearchableUnintialized, 'Use act_as_searchable') unless @searchable

      @searchable.full_text_search(query, self)
    end
  end
end
