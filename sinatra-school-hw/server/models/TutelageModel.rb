class Tutelage < ActiveRecord::Base
  self.table_name = 'tutelage'
  belongs_to :students
  belongs_to :teachers
end
