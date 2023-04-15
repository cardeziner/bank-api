class CreateDeposits < ActiveRecord::Migration[7.0]
  def change
    create_table :deposits do |t|
      t.belongs_to :account
      t.integer :amount

      t.timestamps
    end
  end
end
