class TipoAgressor < ActiveRecord::Base
	self.table_name = 'tipo_agressores'

	has_many :ocorrencias
	has_many :desdobramentos

	validates_presence_of :descricao

end
