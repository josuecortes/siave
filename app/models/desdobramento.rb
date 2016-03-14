class Desdobramento < ActiveRecord::Base

	belongs_to :tipo_ocorrencia
	belongs_to :tipo_agressor
	has_many :tipo_desdobramentos

	has_many :desdobramento_tipo_ocorrencias, :source => :desdobramento_tipo_ocorrencia
	has_many :desdobramento_tipo_agressores, :source => :desdobramento_tipo_agressor



	validates_presence_of :descricao, :tipo
end
