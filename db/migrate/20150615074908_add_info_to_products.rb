class AddInfoToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :location, :string
  	add_column :products, :show_time, :datetime
  	add_column :products, :price, :integer, default: 1
  	add_column :products, :watch_count, :integer, default: 0
  end
end
