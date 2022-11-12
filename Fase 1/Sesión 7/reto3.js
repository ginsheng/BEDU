
  /*
    Usando el pipeline que generaste en el Reto 2, genera la vista
    correspondiente.
  */
  db.createView("comentarios-pelicula", "comments", [{
    $lookup: {
      from: "users",
      localField: "name",
      foreignField: "name",
      as: "user"
    }
  }, {
    $addFields: {
      "user_object": {
        "$arrayElemAt": ["$user", 0]
      }
    }
  }, {
    $addFields: {
      "user_email": "$user_object.email"
    }
  }, {
    $addFields: {
      "user_pass": "$user_object.password"
    }
  }, {
    $project: {
      user_email: 1,
      user_pass: 1,
      _id: 0
    }
  }])
