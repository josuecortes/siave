class Escola < ActiveRecord::Base

	has_many :users

	validates_presence_of :codigo, :nome, :cep

	validates_uniqueness_of :codigo, :nome, :scope => [:codigo]

	
	
end
