# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

u = User.new
u.name="ADMINISTRADOR DO SISTEMA"
u.email="siave@seed.ap.gov.br"
u.password="@#siave$%"
u.password_confirmation="@#siave$%"
u.mudar_senha = false
u.ativo = true

if u.save
	puts "Administrador criado"
else
	puts "erro ao criar Administrador"
end

u = User.find_by(:name=>"ADMINISTRADOR DO SISTEMA", :email=>"siave@seed.ap.gov.br")

a = Role.find_or_create_by(:nome=>"ADMINISTRADOR")

if !u.roles.include?a
	u.roles<<a
end

if u.save
	puts "Perfil #{a.nome} adicionado a #{u.name}"
else
	puts "Erro ao adicionar perfil"
end 

# ENCAMINHAMENTOS

e1 = Encaminhamento.find_or_create_by(:descricao=>"AMBULATORIO (REDE BASICA OU ESPECIALIADA)")
e2 = Encaminhamento.find_or_create_by(:descricao=>"AMBULATORIO DO HOSPITAL")
e3 = Encaminhamento.find_or_create_by(:descricao=>"HOSPITAL/PS")
e4 = Encaminhamento.find_or_create_by(:descricao=>"VARA DA INFANCIA E JUVENTUDE")
e5 = Encaminhamento.find_or_create_by(:descricao=>"CONSELHO TUTELAR")
e6 = Encaminhamento.find_or_create_by(:descricao=>"ABRIGO DE MENORES")
e7 = Encaminhamento.find_or_create_by(:descricao=>"DELEGACIA DE POLICIA")
e8 = Encaminhamento.find_or_create_by(:descricao=>"POLICIA MILITAR")

# TIPOS DE OCORRENCIAS

o1 = TipoOcorrencia.find_or_create_by(:descricao=>"AGRESSAO")

	# DESDOBRAMENTO TIPO OCORRENCIA

	do1 = Desdobramento.find_or_create_by(:descricao=>"FISICA", :tipo=>"TIPO DE OCORRENCIA", :tipo_ocorrencia_id=>o1.id)

		# TIPO DESDOBRAMENTO OCORRENCIA
		tdo1 = TipoDesdobramento.find_or_create_by(:descricao=>"ARMA DE FOGO", :desdobramento_id=>do1.id)
		tdo2 = TipoDesdobramento.find_or_create_by(:descricao=>"ARMA DE BRANCA", :desdobramento_id=>do1.id)
		tdo3 = TipoDesdobramento.find_or_create_by(:descricao=>"AFOGAMENTO", :desdobramento_id=>do1.id)


do2 = Desdobramento.find_or_create_by(:descricao=>"PSICOLOGICA", :tipo=>"TIPO DE OCORRENCIA", :tipo_ocorrencia_id=>o1.id)
do3 = Desdobramento.find_or_create_by(:descricao=>"NEGLIGENCIA", :tipo=>"TIPO DE OCORRENCIA", :tipo_ocorrencia_id=>o1.id)
do4 = Desdobramento.find_or_create_by(:descricao=>"ABANDONO", :tipo=>"TIPO DE OCORRENCIA", :tipo_ocorrencia_id=>o1.id)
do6 = Desdobramento.find_or_create_by(:descricao=>"AUTO-AGRESSAO", :tipo=>"TIPO DE OCORRENCIA", :tipo_ocorrencia_id=>o1.id)

# TIPOS DE AGRESSOR

a1 = TipoAgressor.find_or_create_by(:descricao=>"FAMILIAR")

	# DESDOBRAMENTO TIPO AGRESSOR

	da1 = Desdobramento.find_or_create_by(:descricao=>"MAE", :tipo=>"TIPO DE AGRESSOR", :tipo_agressor_id=>a1.id)
	da2 = Desdobramento.find_or_create_by(:descricao=>"PAI", :tipo=>"TIPO DE AGRESSOR", :tipo_agressor_id=>a1.id)
	da3 = Desdobramento.find_or_create_by(:descricao=>"FILHO", :tipo=>"TIPO DE AGRESSOR", :tipo_agressor_id=>a1.id)
	da4 = Desdobramento.find_or_create_by(:descricao=>"MAE", :tipo=>"TIPO DE AGRESSOR", :tipo_agressor_id=>a1.id)

a2 = TipoAgressor.find_or_create_by(:descricao=>"AMIGO")
a3 = TipoAgressor.find_or_create_by(:descricao=>"COLEGA")
a4 = TipoAgressor.find_or_create_by(:descricao=>"PROFESSOR")
a5 = TipoAgressor.find_or_create_by(:descricao=>"FUNCIONARIO DA ESCOLA")
a6 = TipoAgressor.find_or_create_by(:descricao=>"LADRAO")
a7 = TipoAgressor.find_or_create_by(:descricao=>"ASSALTANTE")


load "#{Rails.root}/db/escolas.rb"