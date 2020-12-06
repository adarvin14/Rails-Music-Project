class Category < ApplicationRecord
    has_many :games
    has_many :users, through: :games

    accepts_nested_attributes_for :restaurants
    
    validates :name, uniqueness: true
end