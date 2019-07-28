Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      post "/:token/register/user", to: "user#create"
      post "/:token/login", to: "session#create"
      get "/:token/current-user", to:"session#show"
      delete "/:token/logout/user", to: "session#destroy"
      post "/:token/notifications", to: "notifications#create"
      post "/:token/change_status", to:"camera_settings#change_status"
      post "/:token/set_time", to:"camera_settings#set_time"
      post "/:token/camera", to:"camera_settings#show"
      get "/:token/notifications", to: "notifications#index"
      post "/:token/notification", to: "notifications#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
