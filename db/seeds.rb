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
u.email="administrador@siave.com"
u.password="123123123"
u.password_confirmation="123123123"
u.mudar_senha = false
u.ativo = true

if u.save
	puts "Administrador criado"
else
	puts "erro ao criar Administrador"
end

u = User.find_by(:name=>"ADMINISTRADOR DO SISTEMA", :email=>"administrador@siave.com")

a = Role.find_or_create_by(:nome=>"ADMINISTRADOR")

if !u.roles.include?a
	u.roles<<a
end

if u.save
	puts "Perfil #{a.nome} adicionado a #{u.name}"
else
	puts "Erro ao adicionar perfil"
end 
