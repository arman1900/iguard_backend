Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/:token/register/user", to: "user#create"
      post "/:token/login", to: "session#create"
      get "/:token/current-user", to:"session#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
