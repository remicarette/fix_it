class CreateEquipements < ActiveRecord::Migration[5.2]
  def change
    create_table :equipements do |t|
      t.references :user, foreign_key: true
      t.string :brand
      t.string :model
      t.string :status

      t.timestamps
    end
  end
end
