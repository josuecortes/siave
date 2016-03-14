class Ocorrencia < ActiveRecord::Base
	self.table_name = 'ocorrencias'

	attr_accessor :agredido_nome

	belongs_to :tipo_ocorrencia
	belongs_to :tipo_agressor
	belongs_to :desdobramento_tipo_ocorrencia, :inverse_of => :desdobramento_tipo_ocorrencias, :class_name => "Desdobramento"
	belongs_to :desdobramento_tipo_agressor, :inverse_of => :desdobramento_tipo_agressores, :class_name => "Desdobramento"
	belongs_to :tipo_desdobramento_ocorrencia, :inverse_of => :tipo_desdobramento_ocorrencias, :class_name => "TipoDesdobramento"
	belongs_to :tipo_desdobramento_agressor, :inverse_of => :tipo_desdobramento_agressores, :class_name => "TipoDesdobramento"
	belongs_to :encaminhamento

	belongs_to :agredido, :inverse_of => :ocorrencias, :class_name => "Pessoa"
	belongs_to :agressor, :inverse_of => :agressoes, :class_name => "Pessoa"
	#has_and_belongs_to_many :agressores, :inverse_of => :agressoes, :class_name => "Pessoa"

	


end
