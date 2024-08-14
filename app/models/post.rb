class Post < ApplicationRecord
    belongs_to :organization
    belongs_to :user
  
    validates :title, :description, presence: true
    validates :organization, presence: true
end
