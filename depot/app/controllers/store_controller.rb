class StoreController < ApplicationController
  def index
		@products = Product.all
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
