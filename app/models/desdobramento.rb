class Desdobramento < ActiveRecord::Base

	belongs_to :tipo_ocorrencia
	belongs_to :tipo_agressor
	has_many :tipo_desdobramentos

	has_many :desdobramento_tipo_ocorrencias, :source => :desdobramento_tipo_ocorrencia
	has_many :desdobramento_tipo_agressores, :source => :desdobramento_tipo_agressor

	validates_presence_of :descricao, :tipo

	validates_uniqueness_of :descricao, :scope => [:tipo_ocorrencia_id]

	validates_uniqueness_of :descricao, :scope => [:tipo_agressor_id]

	validates_presence_of :tipo_ocorrencia_id, :if => :verficiar_tipo_ocorrencia

	validates_presence_of :tipo_agressor_id, :if => :verficiar_tipo_agressor

	def verficiar_tipo_ocorrencia
		if self.tipo == "TIPO DE OCORRENCIA"
			self.tipo_agressor_id = nil
			return true
		else
			return false
		end
	end

	def verficiar_tipo_agressor
		if self.tipo == "TIPO DE AGRESSOR"
			self.tipo_ocorrencia_id = nil
			return true
		else
			return false
		end
	end

end
