class Api::V1::NotificationsController < ApplicationController
    def index
        notification = Notification.all
        render json: notification
    end
    def show 
        notification = Notification.find(params[:camera_id])
        render json:  notification
    end
    def create
        notification = Notification.new(notification_params)
        if notification.save
            ActionCable.server.broadcast 'notifications',
            notification: notification.camera_id,
            picture: notification.picture
            head :ok
            render json: notification
        else
            render json:{errors: notification.errors.full_messages},status: :error
        end
    end
    private
    def notification_params
        params.permit(:camera_id,:picture)
    end
end
