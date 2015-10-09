Rails.application.routes.draw do
  root :to => 'signups#new'
  get 'confirmation/:id' => 'signups#confirmation', :as => "confirmation"
  resources :signups
end
