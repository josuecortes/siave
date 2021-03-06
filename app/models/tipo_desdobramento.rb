class TipoDesdobramento < ActiveRecord::Base
	belongs_to :desdobramento

	has_many :tipo_desdobramento_ocorrencias, :source => :tipo_desdobramento_ocorrencia
	has_many :tipo_desdobramento_agressores, :source => :tipo_desdobramento_agressor

	validates_presence_of :descricao, :desdobramento_id
	validates_uniqueness_of :descricao, :scope => [:desdobramento_id]

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?
		
	end

end
