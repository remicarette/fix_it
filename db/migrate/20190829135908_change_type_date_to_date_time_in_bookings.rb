class ChangeTypeDateToDateTimeInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :begin, :datetime
    change_column :bookings, :end, :datetime
  end
end
