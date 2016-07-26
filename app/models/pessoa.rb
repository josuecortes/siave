class Pessoa < ActiveRecord::Base

	has_many :contatos, dependent: :destroy

	has_many :ocorrencias, :source => :agredido

	has_many :agressoes, :source => :agressor
  #has_and_belongs_to_many :agressoes, :inverse_of => :agressores, :class_name => "Ocorrencia"

  before_save :verificar_documento_deficiente

	accepts_nested_attributes_for :contatos, allow_destroy: true

	validates_presence_of :nome, :data_nascimento, :sexo, :nome_responsavel

	validates_uniqueness_of :nome, :scope => [:data_nascimento]

	validates_presence_of :numero_documento, :if => :documento

	validates_presence_of :tipo_deficiencia, :if => :deficiente

	#validates_presence_of :contatos

  def verificar_documento_deficiente
  	if self.documento == false
  		self.numero_documento = nil
  		self.tipo_documento = nil
  	end
  	if self.deficiente == false
  		self.tipo_deficiencia = nil
  	end
  end

  before_save :maiusculas_sem_acentos

  def maiusculas_sem_acentos

    self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?  
    self.nome_responsavel = ActiveSupport::Inflector.transliterate(self.nome_responsavel).upcase if !self.nome_responsavel.blank?
    self.numero = ActiveSupport::Inflector.transliterate(self.numero).upcase if !self.numero.blank?
    self.complemento = ActiveSupport::Inflector.transliterate(self.complemento).upcase if !self.complemento.blank?

    self.logradouro = ActiveSupport::Inflector.transliterate(self.logradouro).upcase if !self.logradouro.blank?

    self.bairro = ActiveSupport::Inflector.transliterate(self.bairro).upcase if !self.bairro.blank?
    self.cidade = ActiveSupport::Inflector.transliterate(self.cidade).upcase if !self.cidade.blank?
    self.nome_social = ActiveSupport::Inflector.transliterate(self.nome_social).upcase if !self.nome_social.blank?
    
  end

end
