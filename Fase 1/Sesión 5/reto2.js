  // use sample_mflix;

  /* ¿Qué comentarios ha hecho Greg Powell? */

  db.comments.find({
    name: 'Greg Powell'
  }, {
    text: 1
  });

  /* ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler? */

  db.comments.find({
    name: {
      $in: ['Greg Powell', 'Mercedes Tyler']
    }
  }, {
    name: 1,
    text: 1
  });

  // O también:

  db.comments.find({
    $or: [{
        name: 'Greg Powell'
      },
      {
        name: 'Mercedes Tyler'
      }
    ]
  }, {
    name: 1,
    text: 1
  });

  /* ¿Cuál es el máximo número de comentarios en una película? */
  db.comments.aggregate([{
      $group: {
        _id: "$movie_id",
        comentarios: {
          $sum: 1
        }
      }
    },
    {
      $sort: {
        comentarios: -1
      }
    },
    {
      $limit: 1
    }
  ]);

  /* ¿Cuál es título de las cinco películas más comentadas? */
  db.comments.aggregate([{
    $lookup: {
      from: 'movies',
      localField: 'movie_id',
      foreignField: '_id',
      as: 'movie'
    }
  }, {
    $unwind: '$movie'
  }, {
    $group: {
      _id: {
        movie: '$movie.title',
        id: '$movie_id'
      },
      comentarios: {
        $sum: 1
      }
    }
  }, {
    $sort: {
      comentarios: -1
    }
  }, {
    $limit: 5
  }]);
