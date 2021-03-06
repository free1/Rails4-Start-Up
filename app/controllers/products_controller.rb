class ProductsController < ApplicationController
	before_action :signed_in_user, only: [ :new, :create ]

	def index
		@products = Product.order(id: :desc)
		@products = @products.category_for(params[:category]) if params[:category]
		@products = @products.paginate(page: params[:page], per_page: 12)
		@categories = Category.all
	end

	def show
		@product = Product.find(params[:id])
		# @product = Product.find Product.decrypt(params[:id])
		@comments = @product.comments
		@comment = Comment.new
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			flash[:success] = "发布成功"
      redirect_to product_path(@product)
		else
			flash.now[:danger] = "发布失败"
			render 'new'
		end
	end

	private

		def product_params
			params.require(:product).permit(:title, :describe, :cover_path, category_ids: [])
		end

end
