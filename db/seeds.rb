# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.first_or_create! (
    [
        { 
            first_name: "Joel",
            middle_name: nil,
            last_name: "Hartse"
        },
        { 
            first_name: "Hannah",
            middle_name: "P.",
            last_name: "Templer"
        },
        { 
            first_name: "Marguerite",
            middle_name: "Z.",
            last_name: "Duras"
        },
        { 
            first_name: "Kingsley",
            middle_name: nil,
            last_name: "Amis"
        },
        { 
            first_name: "Fannie",
            middle_name: "Peters",
            last_name: "Flagg"
        },
        { 
            first_name: "Camille",
            middle_name: "Byron",
            last_name: "Paglia",
        },
        { 
            first_name: "Rainer",
            middle_name: "Steel",
            last_name: "Rilke",
        }
    ]
)


Publisher.first_or_create! (
    [
        { name: "Paste Magazine" },
        { name: "Publishers Weekly" },
        { name: "Graywolf Press" },
        { name: "McSweeney's" }
    ]
)

Book.first_or_create! (
    [
        { 
            title: "American Elf",
            authors: [ Author.find_by(first_name: "Joel"), Author.find_by(first_name: "Hannah"), Author.find_by(first_name: "Marguerite") ],
            isbn_10: "1-891-83085-6",
            isbn_13: "978-1-891830-85-3",
            list_price: 1000,
            publication_year: "2004",
            publisher: Publisher.find_by(name: "Paste Magazine"),
            edition: "Book 2",
            image_url: "https://m.media-amazon.com/images/I/51NMvOHxcGL.jpg"
        },
        { 
            title: "Cosmoknights",
            authors: [ Author.find_by(first_name: "Kingsley") ],
            isbn_10: "1-603-09454-7",
            isbn_13: "978-1-60309-454-2",
            list_price: 2000,
            publication_year: "2019",
            publisher: Publisher.find_by(name: "Publishers Weekly"),
            edition: "Book 1",
            image_url: "https://m.media-amazon.com/images/I/81dsfFoWPNL._AC_UF1000,1000_QL80_.jpg"
        },
        { 
            title: "Essex County",
            authors: [ Author.find_by(first_name: "Kingsley") ],
            isbn_10: "1-603-09038-X",
            isbn_13: "978-1-60309-038-4",
            list_price: 500,
            publication_year: "1990",
            publisher: Publisher.find_by(name: "Graywolf Press"),
            edition: nil,
            image_url: "https://m.media-amazon.com/images/I/8125Bbu9dsL.jpg"
        },
        { 
            title: "Hey, Mister (Vol 1)",
            authors: [ Author.find_by(first_name: "Hannah"), Author.find_by(first_name: "Fannie"), Author.find_by(first_name: "Camille") ],
            isbn_10: "1-891-83002-3",
            isbn_13: "978-1-891830-02-0",
            list_price: 1200,
            publication_year: "2000",
            publisher: Publisher.find_by(name: "Graywolf Press"),
            edition: "After School Special",
            image_url: "https://m.media-amazon.com/images/I/51pOdbrYd2L._SX317_BO1,204,203,200_.jpg"
        },
        { 
            title: "The Underwater Welder",
            authors: [ Author.find_by(first_name: "Rainer") ],
            isbn_10: "1-603-09398-2",
            isbn_13: "978-1-60309-398-9",
            list_price: 3000,
            publication_year: "2022",
            publisher: Publisher.find_by(name: "McSweeney's"),
            edition: nil,
            image_url: "https://m.media-amazon.com/images/I/91+XkroXM0L._AC_UF1000,1000_QL80_.jpg"
        }
    ]
)