class Patient < ApplicationRecord
	belongs_to :doctor
	belongs_to :condition
	has_many :reports
end
