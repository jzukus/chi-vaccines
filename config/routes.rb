Rails.application.routes.draw do
  resources :measles
  root 'static_pages#home'
  get  '/vaccines_cps',          to: 'static_pages#vaccines_cps'
  get  '/value_vaccines',        to: 'static_pages#value_vaccines'
  get  '/immunization_levels',   to: 'static_pages#immunization_levels'
  get  '/clinic_finder',         to: 'static_pages#clinic_finder'
  get  '/about',                 to: 'static_pages#about'
  get  '/measles_import',        to: 'measles#import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
