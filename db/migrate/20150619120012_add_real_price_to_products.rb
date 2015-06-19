class AddRealPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :real_price, :integer, default: 1
  end
end
