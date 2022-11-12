  // use sample_mflix;

  /* Fecha, nombre y texto de cada comentario. */

  db.comments.find({}, {
    date: 1,
    name: 1,
    text: 1
  });

  /* Título, elenco y año de cada película. */

  db.movies.find({}, {
    title: 1,
    cast: 1,
    year: 1
  });

  /* Nombre y contraseña de cada usuario. */

  db.users.find({}, {
    name: 1,
    password: 1
  });
