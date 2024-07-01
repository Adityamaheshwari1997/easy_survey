class Survey < ApplicationRecord

	#validation
	validates :name, presence: true

	#Association
	has_many :components

end
