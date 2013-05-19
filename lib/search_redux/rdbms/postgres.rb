module SearchRedux
  class Postgres
    def self.compatible_search(query)
      sanitized_query = ActionController::Base.helpers.sanitize(query)

      rank = <<-RANK
        ts_rank(to_tsvector(title), plainto_tsquery('#{sanitized_query}'))
      RANK

      sql  = <<-SQL
           to_tsvector('english', title) @@ plainto_tsquery(:q)
        OR to_tsvector('english', content) @@ plainto_tsquery(:q)
      SQL

      ->(obj) { obj.where(sql, q: query).order("#{rank} desc") }
    end
  end
end
