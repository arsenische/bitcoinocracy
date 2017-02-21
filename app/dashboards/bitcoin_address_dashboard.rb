require "administrate/base_dashboard"

class BitcoinAddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    signatures: Field::HasMany,
    arguments: Field::HasMany,
    id: Field::Number,
    bitcoin_address: Field::String,
    balance: Field::Number,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :signatures,
    :arguments,
    :id,
    :bitcoin_address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :signatures,
    :arguments,
    :id,
    :bitcoin_address,
    :balance,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :signatures,
    :arguments,
    :bitcoin_address,
    :balance,
  ].freeze

  # Overwrite this method to customize how bitcoin addresses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(bitcoin_address)
  #   "BitcoinAddress ##{bitcoin_address.id}"
  # end
end
