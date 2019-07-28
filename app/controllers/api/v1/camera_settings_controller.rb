class Api::V1::CameraSettingsController < ApplicationController
    def change_status
        cam = CameraSetting.find_by_user_id(params[:user_id])
        if cam.user_id == current_user.id
            if cam.status == "On" 
                cam.update_attribute(:status, "Off")
                render json: {success: "Successfully turned off camera"}
            else
                cam.update_attribute(:status, "On")
                render json: {success: "Successfully turned on camera"}
            end
        else
            render json: {errors: "You don't have an access"}, status: :error
        end
    end
    def set_time
        cam = CameraSetting.find_by_user_id(params[:user_id])
        if params[:on_time]
        cam.on_time = (params[:on_time])
        end
        if params[:off_time]
        cam.off_time = (params[:off_time])
        end
    end
    def show 
        cam = CameraSetting.find_by_user_id(params[:user_id])
        render json: cam
    end
end
