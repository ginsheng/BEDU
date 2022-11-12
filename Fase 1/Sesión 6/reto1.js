  /*
    Usando la base de datos sample_airbnblistingsAndReviews,
    realiza los siguientes filtros:
  */

  // Propiedades que no permitan fiestas.

  db.listingsAndReviews.find({
    house_rules: /no party/i
  })

  // Propiedades que admitan mascotas.

  db.listingsAndReviews.find({
    house_rules: /[^(no )]pets allowed/i
  })

  // Propiedades que no permitan fumadores.

  db.listingsAndReviews.find({
    house_rules: /smoker/i
  })

  // Propiedades que no permitan fiestas ni fumadores.

  db.listingsAndReviews.find({
    house_rules: /no party | smokers/i
  })
