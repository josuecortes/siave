class Pessoa < ActiveRecord::Base

	has_many :contatos, dependent: :destroy

	has_many :ocorrencias, :source => :agredido

	has_many :agressoes, :source => :agressor
  #has_and_belongs_to_many :agressoes, :inverse_of => :agressores, :class_name => "Ocorrencia"

  before_save :verificar_documento_deficiente

	accepts_nested_attributes_for :contatos, allow_destroy: true

	validates_presence_of :nome, :data_nascimento, :sexo, :cep, :numero, :nome_responsavel

	validates_uniqueness_of :nome, :scope => [:data_nascimento]

	validates_presence_of :numero_documento, :if => :documento

	validates_presence_of :tipo_deficiencia, :if => :deficiente

	validates_presence_of :contatos

  def verificar_documento_deficiente
  	if self.documento == false
  		self.numero_documento = nil
  		self.tipo_documento = nil
  	end
  	if self.deficiente == false
  		self.tipo_deficiencia = nil
  	end
  end

end
