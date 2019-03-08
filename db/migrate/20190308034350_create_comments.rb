class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :parent_id, default: 0
      t.references :user, foreign_key: true
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
