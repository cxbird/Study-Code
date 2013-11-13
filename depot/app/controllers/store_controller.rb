class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
		@products = Product.all
		@cart = current_cart
		visit_index_count
  end

	private
	def visit_index_count
		if session[:counter].nil?
			session[:counter]=1
		else
			session[:counter]+=1
		end
	end
end
