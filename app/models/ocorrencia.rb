class Ocorrencia < ActiveRecord::Base
	self.table_name = 'ocorrencias'

	attr_accessor :agredido_nome, :agressor_nome

	belongs_to :tipo_ocorrencia
	belongs_to :tipo_agressor
	belongs_to :desdobramento_tipo_ocorrencia, :inverse_of => :desdobramento_tipo_ocorrencias, :class_name => "Desdobramento"
	belongs_to :desdobramento_tipo_agressor, :inverse_of => :desdobramento_tipo_agressores, :class_name => "Desdobramento"
	belongs_to :tipo_desdobramento_ocorrencia, :inverse_of => :tipo_desdobramento_ocorrencias, :class_name => "TipoDesdobramento"
	belongs_to :tipo_desdobramento_agressor, :inverse_of => :tipo_desdobramento_agressores, :class_name => "TipoDesdobramento"
	belongs_to :encaminhamento
	belongs_to :user
	belongs_to :escola

	belongs_to :agredido, :inverse_of => :ocorrencias, :class_name => "Pessoa"
	belongs_to :agressor, :inverse_of => :agressoes, :class_name => "Pessoa"
	#has_and_belongs_to_many :agressores, :inverse_of => :agressoes, :class_name => "Pessoa"

	validates_presence_of :data_ocorrencia, :sob_influencia, :encaminhamento_id, :desdobramento_tipo_ocorrencia_id,
												:tipo_ocorrencia_id, :tipo_agressor_id, :agredido_id, :user_id, :local_ocorrencia

	#validates_presence_of :escola_id,	:message => "Você precisa estar atrelado a uma Escola"

	validates_presence_of :agredido_nome, :if => Proc.new{|p| p.agredido_id.blank?}, :message => "Voce deve selecionar um nome"

	validates_uniqueness_of :numero_protocolo

	after_create :gerar_numero_protocolo

	def gerar_numero_protocolo
		self.numero_protocolo = "#{DateTime.now.year}/#{self.id}"
		self.save
	end
	
	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		  		
		
	end

end
