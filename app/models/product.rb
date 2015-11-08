class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :date, presence: true
	validates :time, presence: true
	has_many :bids, dependent: :destroy
end

