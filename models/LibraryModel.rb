class Library < ActiveRecord::Base
  self.table_name = 'libraries'
  has_many :bookavailability, class_name: 'BookAvailability'
  has_many :books, through: :bookavailability
end
