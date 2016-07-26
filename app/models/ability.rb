class Ability
  include CanCan::Ability

  MASTER = Role.where(:nome=>"MASTER").first
  ADMINISTRADOR = Role.where(:nome=>"ADMINISTRADOR").first
  ESCOLA = Role.where(:nome=>"ESCOLA").first
  ORGAO = Role.where(:nome=>"ORGAO").first
  
  def initialize(user)
    
    if user.roles.include?ADMINISTRADOR
      can :manage, :all      
      cannot [:create, :update], Ocorrencia
      
    end

    if user.roles.include?ESCOLA
      can :manage, Ocorrencia, :escola_id => user.escola_id 
      cannot :delete, Ocorrencia
      can :manage, Pessoa
      cannot :delete, Pessoa
      can :update, User, :id=>user.id
    end

    if user.roles.include?ORGAO
      can :read, Ocorrencia
      can :read, Pessoa
      can :update, User, :id=>user.id
    end


  end
end
