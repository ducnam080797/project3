class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :status
      t.string :cover_image
      t.string :description
      t.string :address
      t.integer :room
      t.integer :liked, default: 0

      t.timestamps
    end
  end
end
