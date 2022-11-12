  /*
  Usando las colecciones comments y users, se requiere conocer el correo y
  contraseña de cada persona que realizó un comentario. Construye un pipeline
  que genere como resultado estos datos.
  */

  db.comments.aggregate({
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
  })
