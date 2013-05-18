module FulltextSearchRedux
  module Postgres
    def compatible_search(query)
      rank = <<-RANK
        ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)}))
      RANK

      sql  = <<-SQL
           to_tsvector('english', title) @@ plainto_tsquery(:q)
        OR to_tsvector('english', content) @@ plainto_tsquery(:q)
      SQL

      [sql, q: query]
    end
end
