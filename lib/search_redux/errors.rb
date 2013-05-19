module SearchRedux
  class Error < StandardError; end

  module Errors
    class ActAsSearchableUnintialized < SearchRedux::Error; end

    class NoQuery < SearchRedux::Error; end
  end
end
