module SearchRedux
  class Postgres
    class << self
      attr_accessor :sanitized_query

      def compatible_search(options)
        query           = options[:query]

        rank_query      = rank_sql options[:rank], query
        search_query    = search_sql options[:columns]

        ->(obj) { obj.where(search_query, q: query).order(rank_query) }
      end

      def rank_sql(rank_column, query)
        sanitized_query = ActionController::Base.helpers.sanitize(query)

        "ts_rank(to_tsvector(#{rank_column}), plainto_tsquery('#{sanitized_query}')) desc"
      end

      def search_sql(columns)
        template = ->(column_name) {
          return "to_tsvector('english', #{column_name}) @@ plainto_tsquery(:q)"
        }

        columns.map { |c| template.call(c) }.join(' OR ')
      end
    end
  end
end
