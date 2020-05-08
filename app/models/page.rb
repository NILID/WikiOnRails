class Page < ApplicationRecord
  has_many :sections

  translates :name, :locale,
    versioning: { :gem => :paper_trail, options: { on: [ :update ], ignore: [:updated_at] } }

  globalize_accessors locales: I18n.available_locales,
                   attributes: [:name]
  accepts_nested_attributes_for :translations

  validates :name, presence: true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
