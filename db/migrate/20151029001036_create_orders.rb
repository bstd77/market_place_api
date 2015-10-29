class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :users, index: true, foreign_key: true
      t.decimal :total

      t.timestamps null: false
    end
  end
end
