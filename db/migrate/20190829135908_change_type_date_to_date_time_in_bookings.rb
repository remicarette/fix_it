class ChangeTypeDateToDateTimeInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :begin, :dateTime
    change_column :bookings, :end, :dateTime
  end
end
