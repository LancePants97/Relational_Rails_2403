class Beer < ApplicationRecord
  belongs_to :brewery

	def self.only_true
		where('dry_hop = ?', true)
	end
end