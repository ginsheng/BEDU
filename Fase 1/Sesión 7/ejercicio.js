  /*
  El ejercicio consiste en obtener, por país, el número de películas que hay de
  cada género.
  */

  db.movies.aggregate({
    $match: {
      "countries.0": {
        $exists: true
      },
      "genres.0": {
        $exists: true
      }
    }
  }, {
    $addFields: {
      country: {
        $arrayElemAt: ["$countries", 0]
      }
    }
  }, {
    $addFields: {
      genre: {
        $arrayElemAt: ["$genres", 0]
      }
    }
  }, {
    $group: {
      _id: {
        Country: "$country",
        Genre: "$genre"
      },
      movies: {
        $sum: 1
      }
    }
  }, {
    $sort: {
      _id: 1
    }
  })
