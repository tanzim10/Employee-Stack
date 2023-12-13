Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root 'home#index'
  get '/aboutus/' => 'home#aboutus'

  #User Routes
  get '/signup/' => 'user#new'
  post '/signup/' => 'user#create'

  # Session Routes
  get '/login/' => 'session#new'
  post '/login/' => 'session#create'

  get '/logout/' => 'session#destroy'

  # Password Routes
  get '/passwords' => 'passwords#edit'
  patch '/passwords/edit' => 'passwords#update'
 
  

  # Employee Routes CRUD
  get '/employees/' => 'employees#index'
  get '/new_employee/' => 'employees#new'
  post '/new_employee/' => 'employees#create'

  get '/edit/:id', to: 'employees#edit', as: 'edit'
  patch '/update/:id', to: 'employees#update', as: 'update'

  get '/destroy/:id', to: 'employees#destroy', as: 'destroy'

  get '/employeebackup/' => 'employee_backups#index'



end
