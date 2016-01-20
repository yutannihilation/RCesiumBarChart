HTMLWidgets.widget({

  name: 'cesium',

  type: 'output',

  initialize: function(el, width, height) {


    var viewer = new Cesium.Viewer(el.id);
    return {
      viewer: viewer
    }

  },

  renderValue: function(el, x_untransposed, instance) {

    var x = HTMLWidgets.dataframeToD3(x_untransposed);

    //debug
    console.log(x);

    for (var i = 0; i < x.length; i++) {
      instance.viewer.entities.add({
        name : 'Cylinder',
        position: Cesium.Cartesian3.fromDegrees(x[i].lon, x[i].lat, x[i].value/2),
        cylinder : {
          length : x[i].value,
          topRadius : 50000,
          bottomRadius : 50000,
          material : Cesium.Color.AQUA.withAlpha(0.5),
        }
      });
    }

    // TODO: Wait until entities are added.
    instance.viewer.zoomTo(instance.viewer.entities);
  },

  resize: function(el, width, height, instance) {

  }

});
