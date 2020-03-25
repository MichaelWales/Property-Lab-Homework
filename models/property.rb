require('pg')

class Property

  attr_accessor :build, :year_built, :number_of_bedrooms, :value

  def initialize(options)
    @build = options['build']
    @year_built = options['year_built'].to_i
    @number_of_bedrooms = options['number_of_bedrooms'].to_i
    @value = options['value'].to_i
    @id = options['id'].to_i if options['id']
  end

  def create()
    db = PG.connect({dbname: 'property', host: 'localhost'})
    sql = "INSERT INTO property
    (
      build,
      year_built,
      number_of_bedrooms,
      value
    )
    VALUES
    (
    $1, $2, $3, $4
    )
    RETURNING id"
    values = [@build, @year_built, @number_of_bedrooms, @value]
    db.prepare("create", sql)
    @id = db.exec_prepared("create", values)[0]["id"].to_i
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'property', host: 'localhost'})
    sql = "UPDATE property
    SET
    (
      build,
      year_built,
      number_of_bedrooms,
      value
    ) =
    (
    $1, $2, $3, $4
    )
    WHERE id = $5"
  values = [@build, @year_built, @number_of_bedrooms, @value, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close
  end

  def delete()
    db = PG.connect({dbname: 'property', host: 'localhost'})
    sql = "DELETE FROM property WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end

  def find()
    db = PG.connect({dbname: 'property', host: 'localhost'})
    sql = "SELECT (id) FROM property WHERE id = $1"
    values = [@id]
    db.prepare("find", sql)
    db.exec_prepared("find", values)
    db.close
  end

end
