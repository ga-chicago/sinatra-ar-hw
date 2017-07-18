class Teacher < ActiveRecord::Base
  self.table_name = 'teachers'
  has_many :tutelages
  has_many :students, through: :tutelages
end
