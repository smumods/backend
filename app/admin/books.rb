ActiveAdmin.register_page "Books" do
    content do
        render 'listings', { 
            categories_with_books: Book.joins(:course).includes(:course).where(is_sold: false).group_by { |book| book.course.module_code }.sort
        }
    end
end