class Page < ApplicationRecord
  translates :name

  globalize_accessors locales: I18n.available_locales,
                   attributes: [:name]
  accepts_nested_attributes_for :translations

  validates :name, presence: true

end
