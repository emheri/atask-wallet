class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, id: false do |t|
      t.binary :id, limit: 16, auto_generate: true, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
