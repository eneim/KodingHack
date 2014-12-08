$(document).ready(function() { /* off-canvas sidebar toggle */
    var mapDatas = [];

    getData();

    window.setInterval(function(){
        /// call your function here
        while(map.dataProvider.images.length > 0) {
            map.dataProvider.images.pop();
        }
        map.validateData();
        getData();
    }, 600000);

    $('[data-toggle=offcanvas]').click(function() {
        $(this).toggleClass('visible-xs text-center');
        $(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
        $('.row-offcanvas').toggleClass('active');
        $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
        $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
        $('#btnShow').toggle();
    });

  $('.nav-filter').on('click', 'a', function(e) {
      var $that = $(this);
      var subject = $that.data('subject');
      var active = $that
                      .parent('li')
                        .siblings()
                        .removeClass('active')
                        .end()
                      .toggleClass('active')
                      .hasClass('active');


      updateMapDataWith(active ? subject : null);
  });

  var updateMapDataWith = function(subject) {
    map.dataProvider.images = []
    for(var i = 0; i < mapDatas.length; i++) {
      var mapData = mapDatas[i];
      if(!subject || mapData.data.dc_subject[0] == subject) {
        map.dataProvider.images.push(mapData);
      }
    }
    map.validateData();
  }


  function getData() {
    $.getJSON('/disasters', function(data) {
        $.each(data, function(i, d) {
            var item = d.raw
            var imageURL = "";
            if (item.dc_subject[0] == "flood") {
                imageURL = "images/icon_flood_on.png";
            } else if (item.dc_subject[0] == "cyclone") {
                imageURL = "images/icon_typhoon_on.png";
            } else if (item.dc_subject[0] == "earthquake") {
                imageURL = "images/icon_earthquake_on.png";
            } else if (item.dc_subject[0] == "volcanoe") {
                imageURL = "images/icon_volcano_on.png";
            };

            var markerColor = '#fffa77';

            if (item.crisis_alertLevel == "Green") {
                markerColor = '#fff601';
            } else if (item.crisis_alertLevel == "Orange") {
                markerColor = '#fe011f';
            } else if (item.crisis_alertLevel == "Red") {
                markerColor = '#d50000';
            };

            mapDatas.push({
                latitude: item.foaf_based_near[1],
                longitude: item.foaf_based_near[0],
                imageURL: imageURL,
                selectable: true,
                width: 32,
                height: 32,
                title: item.dc_description,
                xcolor: markerColor,
                xtype: 'marker',
                data: item
            });
        });
        updateMapDataWith(null);
    });
  };
});

