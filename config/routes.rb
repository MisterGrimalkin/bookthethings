Rails.application.routes.draw do

  root 'application#index'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'user', to: 'users#user_details'

  get 'customers/details', to: 'customers#details'
  get 'customers/locations', to: 'customers#locations'
  get 'customers/companies', to: 'customers#companies'

  post 'customers/request', to: 'customers#request_customership'
  post 'customers/enable', to: 'customers#enable_customership'

  get 'locations', to: 'locations#get_locations'
  post 'locations/create', to: 'locations#create_location'
  post 'locations/update/:id', to: 'locations#update_location'
  post 'locations/link-customer/:id', to: 'locations#link_customer'
  post 'locations/link-provider/:id', to: 'locations#link_provider'

  get 'services', to: 'services#get_services'
  post 'services', to: 'services#create_service'
  put 'services/:service_id', to: 'services#update_service'
  post 'services/add/:service_id', to: 'services#add_service'
  post 'services/remove/:service_id', to: 'services#remove_service'

  get 'services/rates', to: 'rates#get_all_rates'
  get 'services/:service_id/rates', to: 'rates#get_rates'
  post 'services/:service_id/rates', to: 'rates#create_rate'
  put 'services/:service_id/rates/:rate_id', to: 'rates#update_rate'
  delete 'services/:service_id/rates/:rate_id', to: 'rates#delete_rate'
  post 'services/:service_id/rates/:rate_id/fill', to: 'rates#fill_days'

end
