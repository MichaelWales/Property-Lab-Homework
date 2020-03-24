require('pg')

class Property

  attr_reader :build, :year_built, :number_of_bedrooms, :value

  def initialize(options)
    @build = options["build"]
    @year_built = options["year_built"].to_i
    @number_of_bedrooms = options["number_of_bedrooms"].to_i
    @value = options["value"].to_i
  end


end
