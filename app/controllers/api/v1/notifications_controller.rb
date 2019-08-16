class Api::V1::NotificationsController < ApplicationController
    def index
        notification = Notification.all
        render json: notification
    end
    def show 
        notification = Notification.where(camera_id: params[:camera_id])
        render json:  notification
    end
    def show_user_cameras
        cam = CameraSetting.where(user_id: params[:user_id])
        cam.each do |a|    
            @id=a.id
            @notification = Notification.where(camera_id: @id)
            @content = {notification: @notification}
        end
        render json: {:data=> @content, :status=> 200}
    end
    def create
        notification = Notification.new(notification_params)
        if notification.save
            ActionCable.server.broadcast 'notifications',
                notification: notification.picture
            head :ok
        else
            render json:{errors: notification.errors.full_messages},status: :error
        end
    end
    private
    def notification_params
        params.permit(:camera_id,:picture)
    end
end
