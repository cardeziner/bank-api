class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.integer :amount, null: false
      t.integer :recipient_account_id, null: false
      t.belongs_to :account

      t.timestamps, null: false
    end
  end
end
