$(document).ready(function() { /* off-canvas sidebar toggle */

    getData();

    window.setInterval(function(){
        /// call your function here
        while(map.dataProvider.images.length > 0) {
            map.dataProvider.images.pop();
        }
        map.validateData();
        getData();
    }, 60000);

    $('[data-toggle=offcanvas]').click(function() {
        $(this).toggleClass('visible-xs text-center');
        $(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
        $('.row-offcanvas').toggleClass('active');
        $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
        $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
        $('#btnShow').toggle();
    });
});

$('#hi > li').click(function() {
    var $that = $(this);
    $that.siblings().removeClass('active')
    $that.addClass('active');
})


    var auth_token = 'sYmLTrRWcnh2zB3Aqkex';

    function getData() {
        page = 0;
        console.log(page);

        function loopLi() {
            if (page <= 4) {
                page ++;
                var apiCall = "http://api.sigimera.org/v1/crises?page=" + page + "&auth_token=" + auth_token;
                $.getJSON(apiCall, function(data) {
                    $.each(data, function(i, item) {
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

                        map.dataProvider.images.push({
                            latitude: item.foaf_based_near[1],
                            longitude: item.foaf_based_near[0],
                            imageURL: imageURL,
                            width: 32,
                            height: 32,
                            title: item.dc_description,
                            xcolor: markerColor
                        });

                    });

                    map.validateData();
                });

                setTimeout(loopLi,1000);
            }
        }

        loopLi();
    };
