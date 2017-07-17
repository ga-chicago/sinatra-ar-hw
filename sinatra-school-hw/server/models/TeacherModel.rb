class Teacher < ActiveRecord::Base
  self.table_name = 'teachers'
  has_many :tutelage
  has_many :students, through: :tutelage
end
