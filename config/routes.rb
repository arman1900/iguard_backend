Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/:token/register/user", to: "user#create"
      post "/:token/login", to: "session#create"
      get "/:token/current-user", to:"session#show"
      delete "/:token/logout/user", to: "sessions#destroy"
      post "/:token/notifications", to: "notifications#create"
      get "/:token/change_status", to:"camera_settings#change_status"
      post "/:token/set_time", to:"camera_settings#set_time"
      get "/:token/notifications", to: "notifications#index"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
