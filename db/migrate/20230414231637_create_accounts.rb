class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :customer 
      t.integer :balance

      t.timestamps
    end
  end
end
