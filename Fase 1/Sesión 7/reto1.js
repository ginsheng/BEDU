/*
  Con base en el ejemplo 1, modifica el agrupamiento para que muestre el costo
  promedio por habitación por país de las propiedades de tipo casa.
*/


db.listingsAndReviews.aggregate({
  $match: {
    property_type: "House",
    bedrooms: {
      $gt: 0
    }
  }
}, {
  $addFields: {
    costo_promedio_por_recamara: {
      $divide: ["$price", "$bedrooms"]
    }
  }
}, {
  $group: {
    _id: "$address.country",
    recamaras: {
      $sum: 1
    },
    total: {
      $sum: "$costo_promedio_por_recamara"
    }
  }
}, {
  $addFields: {
    costo_promedio: {
      $divide: ["$total", "$recamaras"]
    }
  }
})
