(function($, undefined) {
  $(function() {
    var mapElements = $('[data-map]');
    for (var mi = 0, len = mapElements.length; mi < len; mi++) {
      var mapElement = $(mapElements[mi]);
      eval('var mapData = ' + mapElement.data('map'));
      mapData.map.div = '#' + mapElement.attr('id');
      var map = new GMaps(mapData.map);
      for (var di = 0, dlen = mapData.directives.length; di < dlen; di++) {
        var d = mapData.directives[di];
        map[d.name].apply(map, d.args);
      }
    }
  });
})( jQuery );
