module SearchRedux
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'search_redux.insert_into_active_record' do |app|
      SearchRedux::Railtie.insert
    end

    # rake_tasks { load 'tasks/search_redux.rake' }
  end

  class Railtie
    def self.insert
      if defined? ActiveRecord
        # do the dew
        ActiveRecord::Base.send(:include, SearchRedux::Glue)
      end
    end
  end
end
