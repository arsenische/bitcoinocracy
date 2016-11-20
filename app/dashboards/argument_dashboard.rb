require "administrate/base_dashboard"

class ArgumentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    signatures: Field::HasMany,
    pro_signatures: Field::HasMany.with_options(class_name: "Signature"),
    con_signatures: Field::HasMany.with_options(class_name: "Signature"),
    pros: Field::HasMany.with_options(class_name: "BitcoinAddress"),
    cons: Field::HasMany.with_options(class_name: "BitcoinAddress"),
    id: Field::Number,
    statement: Field::Text,
    aasm_state: Field::String,
    validity: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    pros_sum: Field::Number,
    cons_sum: Field::Number,
    all_sum: Field::Number,
    min_sum: Field::Number,
    last_audits: Field::Text
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :statement,
    :signatures,
    :validity,
    :all_sum,
    :pros,
    :cons,
    :created_at,
    :aasm_state
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :statement,
    :aasm_state,
    :validity,
    :created_at,
    :updated_at,
    :slug,
    :pros_sum,
    :cons_sum,
    :all_sum,
    :min_sum,
    :signatures,
    :last_audits
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :signatures,
    :pro_signatures,
    :con_signatures,
    :pros,
    :cons,
    :statement,
    :validity,
    :slug,
    :pros_sum,
    :cons_sum,
    :all_sum,
    :min_sum,
  ].freeze

  # Overwrite this method to customize how arguments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(argument)
  #   "Argument ##{argument.id}"
  # end
end
