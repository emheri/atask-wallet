class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: false do |t|
      t.binary :id, limit: 16, auto_generate: true, primary_key: true
      t.binary  :entityable_id
      t.string  :entityable_type
      t.integer :balance, default: 0
      
      t.timestamps
    end
  end
end
