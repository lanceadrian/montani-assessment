class Author < ApplicationRecord
    has_and_belongs_to_many :books

    validates_presence_of :first_name, :last_name

    def full_name
        [first_name, middle_name, last_name].reject(&:blank?).join(' ')
    end
end
