class CreateUserPhoneCodes < ActiveRecord::Migration
  def change
    create_table :user_phone_codes do |t|
      t.string :phone
      t.integer :code

      t.timestamps null: false
    end
  end
end
