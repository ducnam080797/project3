class CreateBookinghomes < ActiveRecord::Migration[5.2]
  def change
    create_table :bookinghomes do |t|
      t.date :booking_day
      t.integer :total_money
      t.integer :people

      t.timestamps
    end
  end
end
