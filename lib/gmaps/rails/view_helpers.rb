class GMaps
  module Rails
    module ViewHelpers
      def map_div(gmaps, options={})
        content_tag(:div, nil, {id: 'map', data: {map: h(gmaps.to_s)}}.merge(options))
      end
    end
  end
end
