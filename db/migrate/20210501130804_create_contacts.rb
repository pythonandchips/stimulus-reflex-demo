class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email_address, null: false
      t.string :city, null: false
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
