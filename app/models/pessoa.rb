class Pessoa < ActiveRecord::Base

	has_many :contatos, dependent: :destroy

	has_many :ocorrencias, :source => :agredido

	has_many :agressoes, :source => :agressor
  #has_and_belongs_to_many :agressoes, :inverse_of => :agressores, :class_name => "Ocorrencia"

	accepts_nested_attributes_for :contatos, allow_destroy: true

	validates_presence_of :nome, :data_nascimento, :sexo, :cep, :numero

	validates_uniqueness_of :nome, :scope => [:data_nascimento]

	validates_presence_of :numero_documento, :if => :documento

  

end
