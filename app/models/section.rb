class Section < ApplicationRecord
  belongs_to :page

  translates :name, :content

  globalize_accessors locales: I18n.available_locales,
                   attributes: [:name, :content]
  accepts_nested_attributes_for :translations

  validates :name, :content, presence: true
end
