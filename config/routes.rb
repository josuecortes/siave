Rails.application.routes.draw do
  
  resources :tipo_desdobramentos

  resources :desdobramentos do

    post :atributos_tipo, :on => :collection

  end

  resources :tipo_agressores

  resources :tipo_ocorrencias

  resources :encaminhamentos

  resources :ocorrencias do

    post :criar_pessoa, :on => :collection 

    get :autocomplete_pessoa_nome, :on => :collection

    post :desdobramento_tipo_ocorrencia, :on => :collection

    post :tipo_desdobramento_ocorrencia, :on => :collection

    post :desdobramento_tipo_agressor, :on => :collection

    post :tipo_desdobramento_agressor, :on => :collection

  
  end

  resources :escolas

  resources :contatos

  resources :pessoas do

    post :atributos_documento, :on => :collection

    post :atributos_deficiente, :on => :collection    
      
  end

  get 'home/index'
  get 'home/nao_autorizado'
  
  resources :usuarios do

  	get :redefinir_senha

    get :autocomplete_escola_nome, :on => :collection

  end
  
  devise_for :users
  resources :users

  devise_scope :user do
	  authenticated :user do
	    root 'home#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end



end


