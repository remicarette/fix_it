class ChangeTypeDateToDateTimeInBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :begin, :dateTime
    add_column :bookings, :end, :dateTime
  end
end
