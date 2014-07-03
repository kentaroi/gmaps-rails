require 'gmaps/rails/view_helpers'

class GMaps
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "gmaps-rails.view_helpers" do
        ActionView::Base.send :include, ViewHelpers
      end
    end
  end
end
