  /*
  Usando la colección sample_airbnb.listingsAndReviews, agrega un filtro que
  permita obtener todas las publicaciones que tengan 50 o más comentarios,
  que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet
  vía cable y estén ubicada en Brazil.
  */

  db.listingsAndReviews.find({
    "reviews.51": {
      "$exists": true
    },
    "review_scores.review_scores_rating": {
      $gte: 80
    },
    amenities: {
      $in: ['Internet']
    },
    "address.country": "Brazil"
  }, {
    name: 1,
    number_of_reviews: 1,
    "review_scores.review_scores_rating": 1,
    amenities: 1,
    "address.country": 1
  })
