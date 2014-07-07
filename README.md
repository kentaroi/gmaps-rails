# gmaps-rails

gmaps-rails is a gem which includes [GMaps.js](http://hpneo.github.io/gmaps/)
and provides an easy way to use it in Rails.

GMaps.js has [over 4,000 stars on Github](https://github.com/hpneo/gmaps) and
you will love to use it with Rails.


- This is not [gmaps4rails](https://github.com/apneadiving/Google-Maps-for-Rails) gem.

- If you just want GMaps.js in your Rails app, I recommend
[gmapsjs](https://github.com/xenda/gmapsjs).



## Installation

Add this line to your application's Gemfile:

    gem 'gmaps-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gmaps-rails

## Usage

### GMaps.js
First of all, you have to include Google Maps API in a view file or in a layout file.

```erb
<%= javascript_include_tag 'http://maps.googleapis.com/maps/api/js?key=YOUR_KEY&sensor=true' %>
```

You can use [GMaps.js](http://hpneo.github.io/gmaps/)
simply by requiring `gmaps` in `app/assets/javascripts/application.js` file.

```javascript
    :
    :
//= turbolinks
//= gmaps
//= require_tree .
```

### Helpers
#### GMaps in Ruby
In addition to that, this gem has helpers.

You can define GMaps object in a controller or presenter \(such as [Draper](https://github.com/drapergem/draper)\).

```ruby
@map = GMaps.new(div: '#map', lat: -12.043333, lng: -77.028333)
@map.addMarker(lat: -12.043333,
               lng: -77.028333,
               title: 'Lima',
               click: GMaps::JS["function(e) { alert('You clicked in this marker'); }"])
@map.addMarker(lat: -12.042,
               lng: -77.028333,
               title: 'Marker with InfoWindow',
               infoWindow: {
                 content: '<p>HTML Content</p>'
               })
```

You can show maps as follows:
```erb
<script>
  jQuery(function() {
    <%= @map.to_js %>
  })
</script>
<body>
  <div sytle='width: 800px'>
    <div id='map' style='width: 800px; height: 400px'></div>
  </div>
</body>
```


#### gmaps_ujs
By requiring `gmaps_ujs` in addition to `gmaps`, you can remove all JavaScript code for Google Maps.

```javascript
    :
    :
//= turbolinks
//= gmaps
//= gmaps_ujs
//= require_tree .
```

Controller code is same as the above example, but you can omit `div` parameter when initializing GMaps object.

```ruby
@map = GMaps.new(lat: -12.043333, lng: -77.028333)
```

In a view file, you can show maps by using `map_div` helper method.
```erb
<body>
  <div sytle='width: 800px'>
    <%= map_div @map, style: 'width: 800px; height: 400px' %>
  </div>
</body>
```

## Contributing

1. Fork it ( https://github.com/kentaroi/gmaps-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
