class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :escola_nome

  has_and_belongs_to_many :roles

  has_many :ocorrencias

  belongs_to :escola

	validates_presence_of :name, :email
	validates_uniqueness_of :name, :email

	# def escola_id
	# 	escola.try(:nome)
	# end

	# def escola_id=(nome)
	# 	self.escola = Escola.find_by_nome(nome) if nome.present?
	# end

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.name = ActiveSupport::Inflector.transliterate(self.name).upcase if !self.name.blank?
		
	end

	def e_de_escola
    r = Role.where(:nome=>"ESCOLA").first
    if self.roles.include?r
      return true
    else
      return false
    end 
  end

  def e_admin
    r = Role.where(:nome=>"ADMINISTRADOR").first
    if self.roles.include?r
      return true
    else
      return false
    end 
  end

  def e_de_orgao
    r = Role.where(:nome=>"ORGAO").first
    if self.roles.include?r
      return true
    else
      return false
    end 
  end


end
