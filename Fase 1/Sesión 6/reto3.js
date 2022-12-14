  /*
  Usando la colección sample_airbnb.listingsAndReviews, mediante el uso de
  agregaciones, encontrar el número de publicaciones que tienen conexión a
  Internet, sea desde Wifi o desde cable (Ethernet).
  */


  db.listingsAndReviews.aggregate([{
    $match: {
      amenities: {
        $in: ["Internet", "Wifi"]
      }
    }
  }, {
    $count: "Publicaciones con Internet y Wifi"
  }])
