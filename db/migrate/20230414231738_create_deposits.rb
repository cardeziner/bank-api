class CreateDeposits < ActiveRecord::Migration[7.0]
  def change
    create_table :deposits do |t|
      t.belongs_to :account
      t.integer :amount, null: false

      t.timestamps, null: false
    end
  end
end
