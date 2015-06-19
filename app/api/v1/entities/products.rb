module V1
  module Entities
  	module Products
	    class Products < Grape::Entity
	    	root 'products'
	      expose :id, :title, :location, :show_time, :price, :watch_count, :real_price
	      expose :cover_path do |product|
	      	"http://101.200.235.120#{product.cover_path}"
	      end
	    end

	    class ProductDetail < Grape::Entity
	    	root 'products', 'product'
	    	expose :id, :title, :location, :show_time, :price, :watch_count, :describe, :real_price
	    	expose :cover_path do |product|
	    		"http://101.200.235.120#{product.cover_path}"
	    	end
	    end
    end
  end
end
