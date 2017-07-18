class Student < ActiveRecord::Base
  self.table_name = 'students'
  has_many :tutelages
  has_many :teachers, through: :tutelages
end
