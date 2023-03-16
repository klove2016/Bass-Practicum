class Hobby < ApplicationRecord
  has_many :users, through: :likes
  has_many :likes
  scope :search, -> (query) { where("lower(activity) LIKE ?", "%#{query.downcase}%") if query.present? }

end
