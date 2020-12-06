class Game < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :name, presence: true

    accepts_nested_attributes_for :category, reject_if: :all_blank
end