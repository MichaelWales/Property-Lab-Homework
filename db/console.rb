require('pry-byebug')
require_relative('../models/property')



property1 = Property.new({
  'build' => 'Semi-Detached',
  'year_built' => '1989',
  'number_of_bedrooms' => '3',
  'value' => '150000'
  })

property2 = Property.new({
  'build' => 'Detached',
  'year_built' => '2000',
  'number_of_bedrooms' => '4',
  'value' => '180000'
  })


property1.create()

# property1.year_built = 1991
# property1.update()

# property1.delete()

property1.find(3)

binding.pry
nil
