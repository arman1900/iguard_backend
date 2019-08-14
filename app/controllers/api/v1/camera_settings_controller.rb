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
            if cam.status == "On" 
                cam.update_attribute(:status, "Off")
                render json: cam, only: [:id,:status]
            else
                cam.update_attribute(:status, "On")
                render json: cam, only: [:id,:status]
            end
    end
    def set_time
        CameraSetting.where(user_id: params[:user_id]).all.each do |cam|
            if params[:on_time]
                cam.on_time = params[:on_time]
            end
            if params[:off_time]
                cam.off_time = params[:off_time]
            end
            cam.save  
        end
        cam = CameraSetting.where(user_id: params[:user_id])
        render json: cam
    end
    def show 
        cam = CameraSetting.find(params[:id])
        render json: cam
    end
    def user_cameras
        cam = CameraSetting.where(user_id: params[:user_id])
        render json: cam
    end
    def change_iguard_status
        if status_state == 1 
            CameraSetting.where(user_id: params[:user_id]).all.each do |cam|
                cam.status = "Off"
                cam.save
            end
        else
            CameraSetting.where(user_id: params[:user_id]).all.each do |cam|
                cam.status = "On"
                cam.save
            end
        end
        cam = CameraSetting.where(user_id: params[:user_id])
        render json: cam 
    end
    def status
            s = status_state
            render json: s
        
    end
    private
    def camera_params
        params.permit(:user_id)
    end
end
