class CreateWithdrawals < ActiveRecord::Migration[7.0]
  def change
    create_table :withdrawals do |t|
      t.belongs_to :account
      t.integer :integer, null: false

      t.timestamps, null: false
    end
  end
end
