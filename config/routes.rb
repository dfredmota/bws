Rails.application.routes.draw do

  resources :bem_colaboradores
  get 'controle_alocacoes/index'
  get 'locacoes' => 'locacoes#index'
  get 'locacoes/materiais'
  get 'controle_alocacoes' => 'controle_alocacoes#index'
  get 'controle_alocacoes/itens'
  get 'bens/gera_patrimonio' => 'bens#gera_patrimonio'

  scope path_names: { new: 'novo', edit: 'editar' } do
    resources :material_locados
    resources :fornecedores
    resources :funcoes
    resources :prazo_locacoes
    resources :usuarios_mobiles
    resources :almoxarifes
    resources :bens
    resources :setores
    resources :centro_custos
    resources :colaboradores
    resources :posts
    resource  :funcao
    resources :materiais
    resources :insumos
    resources :grupo_insumos
    resources :estado_conservacoes

    namespace "admin" do
      resources :users do
        get 'redefinir_senha'
      end
    end
  end

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }, path_names: {sign_in: "login", sign_out: "logout"}
  as :user do
    get "/login" => "users/sessions#new"
    post "/login" => "users/sessions#create"
    delete "/logout" => "users/sessions#destroy"
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index", :as => :home

  get 'home' => "home#index"

  get "logout" => "users/sessions#new"



  TheRoleManagementPanel::Routes.mixin(self)
  patch '/admin/roles/:id/change' => 'admin/roles#change'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
