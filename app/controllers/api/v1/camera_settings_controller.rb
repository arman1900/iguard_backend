class Api::V1::CameraSettingsController < ApplicationController
    def index 
        cam = CameraSetting.all 
        render json: cam
    end
    def create
        cam = CameraSetting.new(camera_params)
        if cam.save
            render json: cam
        else
            render json:{errors: cam.errors.full_messages},status: :error
        end
    end
    def delete
        begin
            cam = CameraSetting.find(params[:id])
        rescue
            render json: {errors: "Camera does not exist"}, status: :error
        ensure
            if cam.destroy!
                render json: {success: "Deleted Successfully"}
            else
                render json: {errors: cam.errors.full_messages}, status: :error
            end
        end
    end
    def change_status
        cam = CameraSetting.find(params[:id])
        if cam.user_id == current_user.id
            if cam.status == "On" 
                cam.update_attribute(:status, "Off")
                render json: cam, only: [:id,:status]
            else
                cam.update_attribute(:status, "On")
                render json: cam, only: [:id,:status]
            end
        else
            render json: {errors: "You don't have an access"}, status: :error
        end
    end
    def set_time
        cam = CameraSetting.find(params[:id])
        if params[:on_time]
            cam.update_attribute(:on_time, params[:on_time])
        end
        if params[:off_time]
            cam.update_attribute(:off_time, params[:off_time])
        end
            render json: cam    
    end
    def show 
        cam = CameraSetting.find_by_user_id(params[:user_id])
        render json: cam
    end
    private
    def camera_params
        params.permit(:user_id)
    end
end
