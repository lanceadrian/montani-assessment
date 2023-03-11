class Book < ApplicationRecord
    # include PgSearch::Model
    # pg_search_scope :search_by_isbn, against: [:isbn_13]
    
    has_and_belongs_to_many :authors
    belongs_to :publisher
    delegate :name, to: :publisher, prefix: true

    validates_presence_of :title, :list_price, :publication_year, :publisher
    validates :isbn_13, presence: true, uniqueness: true
    validate :valid_isbn_13

    private

    def valid_isbn_13
        trimmed_isbn = isbn_13.delete('^0-9')
        isbn_array = trimmed_isbn.split("")

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