class TipoAgressor < ActiveRecord::Base
	self.table_name = 'tipo_agressores'

	has_many :ocorrencias
	has_many :desdobramentos

	validates_presence_of :descricao
	validates_uniqueness_of :descricao

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?	
		
	end

end
