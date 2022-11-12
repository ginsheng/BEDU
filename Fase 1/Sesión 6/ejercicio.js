  /*
  La base de datos y colección que debes usar es
  sample_airbnb.listingsAndReviews.

  El ejercicio consiste en obtener todas las publicaciones que tengan 50 o más
  comentarios, que la valoración sea mayor o igual a 80, que cuenten con
  conexión a Internet vía cable y estén ubicadas en Brazil.

  */

  db.listingsAndReviews.aggregate([{
    $match: {
      amenities: {
        $in: ["Internet"]
      },
      "review_scores.review_scores_rating": {
        $gte: 80
      },
      "reviews.51": {
        "$exists": true
      },
      "address.country": "Brazil"
    }
  }, {
    $count: "Casitas puntuadas arriba de 80, más de 50 reviews con Internet y Wifi, en Brasil"
  }])
