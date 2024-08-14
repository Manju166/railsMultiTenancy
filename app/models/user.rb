class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
           has_many :posts
           has_many :memberships
           has_many :organizations, through: :memberships
    belongs_to :organization
      validates :organization_id, presence: true
end