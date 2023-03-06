module SearchRedux
  require 'rails'

  class Railtie < Rails::Railtie
    initializer 'search_redux.insert_into_active_record' do |app|
      SearchRedux::Railtie.insert
    end
  end

  class Railtie
    def self.insert
      if defined? ActiveRecord
        ActiveRecord::Base.send(:include, SearchRedux::Glue)
      end
    end
  end
end
