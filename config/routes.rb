Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      post "/:token/register/user", to: "user#create"
      get "/:token/users", to: "user#index"
      patch "/:token/user/:id", to: "user#update"
      delete "/:token/user/:id", to: "user#delete"
      delete "/:token/camera/:id", to: "camera_settings#delete"
      post "/:token/register/camera", to: "camera_settings#create"
      post "/:token/login", to: "session#create"
      get "/:token/current-user", to:"session#show"
      delete "/:token/logout/user/:id", to: "session#destroy"
      post "/:token/notifications", to: "notifications#create"
      post "/:token/change_status", to:"camera_settings#change_status"
      post "/:token/set_time", to:"camera_settings#set_time"
      post "/:token/camera", to:"camera_settings#show"
      get "/:token/notifications", to: "notifications#index"
      post "/:token/notification", to: "notifications#show"
      post "/:token/security", to:"security#create"
      get "/:token/securities", to:"security#index"
      get "/:token/cameras", to:"camera_settings#index"
      post "/:token/user/cameras", to:"camera_settings#user_cameras"
      post "/:token/status", to:"camera_settings#status"
      post "/:token/change_iguard_status", to:"camera_settings#change_iguard_status"
      get "/:token/user_notifications/:user_id", to:"notifications#show_user_cameras"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
