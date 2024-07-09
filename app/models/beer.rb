class Beer < ApplicationRecord
  belongs_to :brewery

	def self.only_true
		where('dry_hop = ?', true)
	end

	def self.alphabetical_order
		order(:style_name)
	end
end