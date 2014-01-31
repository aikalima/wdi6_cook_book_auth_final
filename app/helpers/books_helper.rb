module BooksHelper
	def check_book_owner
		book = current_user.books.where(:id => params[:id]).first
    	if book.nil?
    		flash[:error] = "That's not your book."
			redirect_to book_path(params[:id])
		end
	end
end
