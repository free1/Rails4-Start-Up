module V1
  module Entities
    class Products < Grape::Entity
      expose :id, :title, :location, :show_time, :price, :watch_count
      expose :cover_path do |product|
      	"http://101.200.235.120#{product.cover_path}"
      end
    end

    class ProductDetail < Grape::Entity
    	expose :id, :title, :location, :show_time, :price, :watch_count, :describe
    	expose :cover_path do |product|
    		"http://101.200.235.120#{product.cover_path}"
    	end
    end
  end
end
