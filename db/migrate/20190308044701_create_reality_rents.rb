class CreateRealityRents < ActiveRecord::Migration[5.2]
  def change
    create_table :reality_rents do |t|
      t.integer :reality_day
      t.integer :total_money
      t.integer :people
      t.integer :surcharge

      t.timestamps
    end
  end
end
