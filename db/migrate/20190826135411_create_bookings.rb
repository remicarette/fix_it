class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :equipement, foreign_key: true
      t.references :user, foreign_key: true
      t.string :error_code
      t.string :description
      t.string :status
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
