class CreateEmail < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.references :invoice, null: false
      t.string :sent_to, null: false
      t.string :status, default: "sending"
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
