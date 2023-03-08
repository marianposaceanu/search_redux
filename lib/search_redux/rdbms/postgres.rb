module SearchRedux
  class Postgres
    class << self
      attr_accessor :sanitized_query

      def compatible_search(options)
        query        = to_ts_query(options[:query])
        rank_query   = rank_sql(options[:rank], query)
        search_query = search_sql(options[:columns])

        ->(obj) { obj.where(Arel.sql(search_query), q: Arel.sql(query)).order(Arel.sql(rank_query)) }
      end

      def to_ts_query(query)
        words = query.scan(/\s*("([^"]+)"|\w+)\s*/)&.flatten&.compact
        words.map { |ts| "#{ts}:*" }.join(" & ")
      end

      def rank_sql(rank_column, query)
        "ts_rank(to_tsvector(#{rank_column}), to_tsquery('#{query}')) desc"
      end

      def search_sql(columns)
        template = ->(column_name) {
          return "to_tsvector('english', #{column_name}) @@ to_tsquery(:q)"
        }

        columns.map { |c| template.call(c) }.join(' OR ')
      end
    end
  end
end
