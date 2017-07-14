Rails.application.routes.draw do
 namespace :api, defaults: { format: :json } do
   resources :gifts, only: [:index, :show]
   resources :guests, only: [:index, :show] do
     resources :gifts, only: [:index, :show]
   end
   resources :parties, only: [:index, :show]
   resources :invitations, only: [:index, :show]
 end
end
