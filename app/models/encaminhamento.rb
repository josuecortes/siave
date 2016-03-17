class Encaminhamento < ActiveRecord::Base

	has_many :ocorrencias

	validates_presence_of :descricao

	validates_uniqueness_of :descricao

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?  

	end

end
