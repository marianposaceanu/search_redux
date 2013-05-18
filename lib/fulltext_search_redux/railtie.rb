module FulltextSearchRedux
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'fulltext_search_redux.insert_into_active_record'
      FulltextSearchRedux::Railtie.insert
    end
    
    # rake_tasks { load 'tasks/fulltext_search_redux.rake' }
  end

  class Railtie
    def self.insert
      if defined? ActiveRecord
        # do the dew
        ActiveRecord::Base.send(:include, FulltextSearchRedux::Glue)
      end
    end
  end
end
