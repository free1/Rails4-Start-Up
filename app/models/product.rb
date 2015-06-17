class Product < ActiveRecord::Base
	# include Obfuscate
	mount_uploader :cover_path, AvatarUploader

	# 发布人
	belongs_to :user
	# 收藏
	has_many :user_collect_products, dependent: :destroy
	has_many :collected_user, through: :user_collect_products, source: :user
	# 分类
	has_many :product_category_ships, dependent: :destroy
	has_many :categories, through: :product_category_ships
	# 评论
	has_many :comments, as: :commentable

	# 验证
	# validates_presence_of :user, :cover_path
	# validates :title, presence: true, length: { maximum: 30 }
	# validates :describe, presence: true, length: { maximum: 5000 }
	
	# 排序
	scope :category_for, ->(category_name) { joins(:categories).where("categories.name = ?", category_name)}

	def incr
		self.update_attribute(:watch_count, self.watch_count + 1)
	end

	# def to_param
 #    encrypt id
 #  end
	
end
