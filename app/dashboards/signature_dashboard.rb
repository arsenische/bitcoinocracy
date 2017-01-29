require "administrate/base_dashboard"

class SignatureDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    argument: Field::BelongsTo,
    bitcoin_address: Field::BelongsTo,
    negation: Field::Boolean,
    signature: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :argument,
    :bitcoin_address,
    :negation,
    :signature,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :argument,
    :bitcoin_address,
    :negation,
    :signature,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :argument,
    :bitcoin_address,
    :negation,
    :signature,
  ].freeze

  # Overwrite this method to customize how signatures are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(signature)
  #   "Signature ##{signature.id}"
  # end
end
