class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: false do |t|
      t.binary :id, limit: 16, auto_generate: true, primary_key: true
      t.references :wallet, null: false, foreign_key: true, type: :binary
      t.string :transaction_type, limit: 10
      t.integer :amount
      t.jsonb :details

      t.timestamps
    end
  end
end
