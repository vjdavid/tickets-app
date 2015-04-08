class Ticket < ActiveRecord::Base
	belongs_to :proyect
	validates :name, :description, presence: true
end
