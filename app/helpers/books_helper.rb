module BooksHelper
    def valid_isbn?(isbn)
        return valid_isbn_10(isbn) if is_isbn_10?(isbn)
        return valid_isbn_13(isbn) if is_isbn_13?(isbn)
        return false
    end

    def format_isbn(isbn)
        return format_isbn_10(isbn) if is_isbn_10?(isbn)
        return format_isbn_13(isbn) if is_isbn_13?(isbn)
    end

    def convert_isbn(isbn)
        return convert_isbn_10_to_isbn_13(isbn) if is_isbn_10?(isbn)
        return convert_isbn_13_to_isbn_10(isbn) if is_isbn_13?(isbn)
    end

    def is_isbn_10?(isbn)
        isbn_array = convert_to_array(isbn)
        return ( isbn_array.count() == 10 ) ? true : false
    end
        
    def is_isbn_13?(isbn)
        isbn_array = convert_to_array(isbn)
        return ( isbn_array.count() == 13 ) ? true : false
    end

    def author_display(authors)
        names = authors.map(&:full_name)
        return "by " + names.join(", ")
    end
    
    private

    def convert_to_array(isbn)
        trimmed_isbn = isbn.delete('^0-9')
        return trimmed_isbn.split("")
    end

    def valid_isbn_10(isbn)
        isbn_array = convert_to_array(isbn)

        total = 0
        isbn_array.each_with_index { |number, index| total += (10 - index) * number.to_i }

        remainder = total % 11
        return ( remainder == 0 ? true : false )
    end

    def valid_isbn_13(isbn)
        isbn_array = convert_to_array(isbn)

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

    def format_isbn_10(isbn)
        isbn_array = convert_to_array(isbn)
        return isbn_array[0] + "-" + isbn_array[1] + isbn_array[2] + isbn_array[3] + "-" + isbn_array[4] + isbn_array[5] + isbn_array[6] + isbn_array[7] + isbn_array[8] + "-" + isbn_array[9] 
    end

    def format_isbn_13(isbn)
        isbn_array = convert_to_array(isbn)
        return isbn_array[0] + isbn_array[1] + isbn_array[2] + "-" + isbn_array[3] + "-" + isbn_array[4] + isbn_array[5] + isbn_array[6] + isbn_array[7] + isbn_array[8] + "-" + isbn_array[9] + isbn_array[10] + isbn_array[11] + "-" + isbn_array[12]
    end

    def convert_isbn_10_to_isbn_13(isbn)
        isbn_array = convert_to_array(isbn)
        isbn_array.pop()

        isbn_array.unshift("8")
        isbn_array.unshift("7")
        isbn_array.unshift("9")

        total = 0
        isbn_array.each_with_index do |number, index|
            if index == 0 || index.even?
                total += number.to_i * 1
            else
                total += number.to_i * 3
            end
        end

        remainder = total % 10
        last_digit = 10 - remainder
        isbn_array.push(last_digit.to_s)
        
        isbn = isbn_array.join()
        return format_isbn(isbn)
    end

    def convert_isbn_13_to_isbn_10(isbn)
        isbn_array = convert_to_array(isbn)
        isbn_array.pop()
        isbn_array.shift(3)

        total = 0
        isbn_array.each_with_index { |number, index| total += (10 - index) * number.to_i }
        remainder = total % 11
        last_digit = 10 - remainder
        isbn_array.push(last_digit.to_s)

        isbn = isbn_array.join()
        return format_isbn(isbn)
    end
end