class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates_presence_of :first_name, :last_name
end
