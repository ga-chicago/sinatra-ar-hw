class BookAvailability < ActiveRecord::Base
  self.table_name = 'book_availability'
  belongs_to :book
  belongs_to :library
end