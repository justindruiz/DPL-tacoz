Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show, :vegetarian], path: 'our-food'


  namespace :admin do
    get '/' => 'base#index'

    resources :menu_items
  end

end
