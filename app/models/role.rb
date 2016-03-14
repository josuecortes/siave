class Role < ActiveRecord::Base

	has_and_belongs_to_many :users

	validates_presence_of :nome
	validates_uniqueness_of :nome
end
