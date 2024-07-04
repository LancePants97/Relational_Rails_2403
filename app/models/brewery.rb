class Brewery < ApplicationRecord
  has_many :beers

	def self.order_by_recently_created
		order(created_at: :desc)
	end

	def beer_count
		self.beers.count
	end

end