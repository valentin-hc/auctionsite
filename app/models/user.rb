class User < ActiveRecord::Base
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :email, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	has_many :products, dependent: :destroy 
end
