class Student < ActiveRecord::Base
  self.table_name = 'students'
  has_many :tutelage
  has_many :teachers, through: :tutelage
end
