module SearchRedux
  module Helpers
    def select_best_query_strategy(adapter, query)
      case adapter
      when /mysql.*/i
        SearchRedux::Mysql.compatible_search(query)
      when /postgres.*/i
        SearchRedux::Postgres.compatible_search(query)
      end
    end

    def db_adapter
      ActiveRecord::Base::connection.adapter_name
    end
  end
end
