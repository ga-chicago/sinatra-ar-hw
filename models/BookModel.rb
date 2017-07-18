class Book < ActiveRecord::Base
  self.table_name = 'books'
  has_many :bookavailability, class_name: 'BookAvailability'
  has_many :libraries, through: :bookavailability
end