class Tutelage < ActiveRecord::Base
  self.table_name = 'tutelage'
  belongs_to :student
  belongs_to :teacher
end
