module BooksHelper
    def self.get_book_url(book)
        "https://smumods.com/book/#{book.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}/#{book.isbn10}/#{book.uuid}"
    end
end
