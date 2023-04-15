class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.belongs_to :account

      t.timestamps
    end
  end
end
