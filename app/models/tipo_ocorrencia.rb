class TipoOcorrencia < ActiveRecord::Base

	has_many :ocorrencias
	has_many :desdobramentos

	validates_presence_of :descricao

end
