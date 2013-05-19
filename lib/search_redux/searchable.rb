module SearchRedux
  extend Helpers

  class Searchable
    attr_accessor :columns
    attr_accessor :rank
    attr_reader   :options

    def self.default_options
      @default_options ||= {
        :columns => %w(title content),
        :rank    => 'title'
      }
    end

    def initialize(options = {})
      options = self.class.default_options.merge(options)

      @options = options
    end

    def full_text_search(query, active_record_instance)
      if query.present?
        @options.merge! :query => query

        adapter  = SearchRedux.db_adapter
        strategy = SearchRedux.select_best_query_strategy(adapter, @options)

        strategy.call(active_record_instance)
      else
        active_record_instance.scoped
      end
    end
  end
end
