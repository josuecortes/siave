class TipoDesdobramento < ActiveRecord::Base
	belongs_to :desdobramento

	has_many :tipo_desdobramento_ocorrencias, :source => :tipo_desdobramento_ocorrencia
	has_many :tipo_desdobramento_agressores, :source => :tipo_desdobramento_agressor

	validates_presence_of :descricao

end
