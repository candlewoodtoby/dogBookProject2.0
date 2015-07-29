class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :weight
      t.integer :age
      t.string :color
      t.string :gender
      t.string :city
      t.string :personality
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
