class Page < ApplicationRecord
  has_many :blocks

  translates :name

  globalize_accessors locales: I18n.available_locales,
                   attributes: [:name]
  accepts_nested_attributes_for :translations

  validates :name, presence: true
end
