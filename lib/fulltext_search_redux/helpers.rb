module FulltextSearchRedux
  module Helpers
    def select_best_query_stategy(adapter, query)
      case adapter
      when /mysql.*/i    
        FulltextSearchRedux::Mysql.compatible_search(query)
      when /postgres.*/i 
        FulltextSearchRedux::Postgres.compatible_search(query)
      end
    end

    def db_adapter
      ActiveRecord::Base::connection.adapter_name
    end
  end
end
