class Song < ApplicationRecord
    belongs_to :genre
    belongs_to :user

    validates :name, presence: true

    accepts_nested_attributes_for :genre, reject_if: :all_blank
end