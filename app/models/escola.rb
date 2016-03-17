class Escola < ActiveRecord::Base

	has_many :users
	has_many :ocorrencias

	validates_presence_of :codigo, :nome

	validates_uniqueness_of :codigo, :nome, :scope => [:codigo]

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?  
		self.codigo = ActiveSupport::Inflector.transliterate(self.codigo).upcase if !self.codigo.blank?  
		
	end

	
	
end
