class Book < ApplicationRecord
    belongs_to :authors

    validates_presence_of :title, :list_price, :publication_year, :publisher, :authors
    validates :isbn_10, presence: true, uniqueness: true
    validates :isbn_13, presence: true, uniqueness: true

    validate :valid_isbn_10, :valid_isbn_13

    def valid_isbn_10
        isbn = isbn_10.delete('^0-9')
        isbn_array = isbn.split("")

        total = 0
        isbn_array.each_with_index { |number, index| total += (10 - index) * number.to_i }

        return ( total % 11 ? true : false )
    end

    def valid_isbn_13
        isbn = isbn_13.delete('^0-9')
        isbn_array = isbn.split("")
    
        total = 0
        isbn_array.each_with_index do |number, index|
            if index == 0 || index.even?
                total += number.to_i * 1
            else
                total += number.to_i * 3
            end
        end
        
        remainder = total % 10
        return ( remainder == 0 ? true : false )
    end
end
