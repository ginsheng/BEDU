
  /*     Obtén los datos de contacto de cada compañía.
  */

    db.companies.find({}, {
      email_address: 1,
      phone_number: 1,
      twitter_username: 1,
      _id: 0
  }).limit(10);

  /*     Obtén el identificador de la clase de cada calificación.
  */

  db.grades.find({}, {
    class_id: 1
  });

  /*     Obtén el nombre de todas las compañias fundadas en octubre.
  */

  db.companies.find({
    founded_month: 10
  }, {
    name: 1,
    _id: 0
  });

  /*     Obtén el nombre de todas las compañías fundadas en 2008.
  */

  db.companies.find({
    founded_year: 2008
  }, {
    name: 1,
    _id: 0
  });

  /*     Obtén todos los post del autor machine.
  */

  db.posts.find({
    author: 'machine'
  });

  /*     Obtén todas las calificaciones provenientes de los grupos 357, 57 y 465.
  */

  db.grades.find({
    class_id: {
      $in: [357, 57, 465]
    }
  }).sort({
    class_id: 1
  });

  /*     Obtén todas las compañías fundadas en octubre del 2008.
  */

  db.companies.find({
    $and: [{
      founded_month: 10
    }, {
      founded_year: 2008
    }]
  }, {
    name: 1,
    founded_month: 1,
    founded_year: 1
  });

  /*     Obtén todas las compañias con más de 50 empleados.
  */

  db.companies.find({
    number_of_employees: {
      $gt: 50
    }
  });

  /*     Obtén las rutas con un número de paradas entre 1 y 5.
  */

  db.routes.find({
    $and: [{
      stops: {
        $gte: 1
      }
    }, {
      stops: {
        $lte: 5
      }
    }]
  });

  /*     Obtén la empresa con el menor número de empleados.
  */

  db.companies.find({
    number_of_employees: {
      $gt: 0
    }
  }, {
    name: 1,
    number_of_employees: 1
  }).sort({
    number_of_employees: 1
  }).limit(1);

  /*     Obtén la empresa con el mayor número de empleados.
  */

  db.companies.find({}, {
    name: 1,
    number_of_employees: 1
  }).sort({
    number_of_employees: -1
  }).limit(1);

  /*     Obtén el viaje con mayor duración.
  */

  db.trips.find({
    tripduration: {
      $gt: 0
    }
  }).sort({
    tripduration: -1
  }).limit(1);

  /*     Obtén el viaje con menor duración.
  */

  db.trips.find({
    tripduration: {
      $gt: 0
    }
  }).sort({
    tripduration: 1
  }).limit(1);
