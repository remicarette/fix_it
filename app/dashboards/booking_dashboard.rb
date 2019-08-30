require "administrate/base_dashboard"

class BookingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    equipement: Field::BelongsTo,
    reviews: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    error_code: Field::String,
    description: Field::String,
    status: Field::Number,
    begin: Field::DateTime,
    end: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :equipement,
    :reviews,
    :user,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :equipement,
    :reviews,
    :user,
    :id,
    :error_code,
    :description,
    :status,
    :begin,
    :end,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :equipement,
    :reviews,
    :user,
    :error_code,
    :description,
    :status,
    :begin,
    :end,
  ].freeze

  # Overwrite this method to customize how bookings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(booking)
  #   "Booking ##{booking.id}"
  # end
end
