class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :invoice, null: false
      t.string :description, null: false
      t.decimal :price, null: false
      t.decimal :quantity, null: false

      t.timestamps
    end
  end
end
