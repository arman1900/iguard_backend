class Api::V1::NotificationsController < ApplicationController
    def create
        notification = Notification.new(notification_params)
        if notification.save
            render json: notification
        else
            render json:{errors: notification.errors.full_messages},status: :error
        end
    end
    private
    def notification_params
        params.permit(:camera_id,:frame)
    end
end
