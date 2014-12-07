
var continentsDataProvider = {
    map: "continentsLow",

    areas: [{
        id: "africa",
        color: "#605675",
        passZoomValuesToTarget: true
    }, {
        id: "asia",
        color: "#a791b4",
        passZoomValuesToTarget: true
    }, {
        id: "australia",
        color: "#7f7891",
        passZoomValuesToTarget: true
    }, {
        id: "europe",
        color: "#9186a2",
        passZoomValuesToTarget: true
    }, {
        id: "north_america",
        color: "#868191",
        passZoomValuesToTarget: true
    }, {
        id: "south_america",
        color: "#8f7ea9",
        passZoomValuesToTarget: true
    }],

    images: []
};

var map = AmCharts.makeChart("mapdiv", {
    type: "map",
    theme: "light",
    pathToImages: "images/",
    smallMap: new AmCharts.SmallMap(),

    imagesSettings: {
        rollOverColor: "#089282",
        rollOverScale: 2,
        selectedScale: 1,
        selectedColor: "#089282",
        color: "#13564e"
    },

    zoomControl: {
        buttonFillColor: "#15A892"
    },

    areasSettings: {
        autoZoom: true,
        rollOverOutlineColor: "#3e3639",
        selectedColor: "#9a7bca",
        color: "#009688",
        rollOverColor: "#9a7bca"
    },


    dataProvider: {
    map: "worldLow",
    getAreasFromMap: true,
    images: []
}

    //dataProvider: continentsDataProvider
});

map.addListener("clickMapObject", function (event) {
    // check if the map is already at traget zoomLevel and go to url if it is
    if (event.mapObject.xtype == 'marker') {
      console.log(event.mapObject.data)
      $('#donation-modal-label').text(
        "New Donation for " + event.mapObject.data.dc_title
      );
      $('#donateDialog')
        .data('data', event.mapObject.data)
        .modal('show')
    }
});

// add events to recalculate map position when the map is moved or zoomed
map.addListener("positionChanged", updateCustomMarkers);

// this function will take current images on the map and create HTML elements for them
function updateCustomMarkers(event) {
    // get map object
    var map = event.chart;

    // go through all of the images
    for (var x in map.dataProvider.images) {
        var image = map.dataProvider.images[x];

        // check if it has corresponding HTML element
        if ('undefined' == typeof image.externalElement)
            image.externalElement = createCustomMarker(image);
            else {
                image.chart.chartDiv.appendChild(image.externalElement);
            }
            // reposition the element accoridng to coordinates
            image.externalElement.style.top = map.latitudeToY(image.latitude) + 'px';
            image.externalElement.style.left = map.longitudeToX(image.longitude) + 'px';
        }
    }

    // this function creates and returns a new marker element
    function createCustomMarker(image) {
        // create holder
        var holder = document.createElement('div');
        holder.className = 'map-marker';
        holder.title = image.title;
        holder.style.position = 'absolute';

        // create dot
        var dot = document.createElement('div');
        dot.className = 'dot';
        dot.style.border = '10px solid' + image.xcolor;
        holder.appendChild(dot);

        /*
        // create pulse
        var pulse = document.createElement('div');
        pulse.className = 'pulse';
        holder.appendChild(pulse);
        */

        // append the marker to the map container
        image.chart.chartDiv.appendChild(holder);

        return holder;
    }
