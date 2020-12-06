class Genre < ApplicationRecord
    has_many :songs
    has_many :users, through: :songs

    accepts_nested_attributes_for :songs
    
    validates :name, uniqueness: true
end