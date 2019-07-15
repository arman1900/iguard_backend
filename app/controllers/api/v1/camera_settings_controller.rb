class Api::V1::CameraSettingsController < ApplicationController
    def change_status
        cam = CameraSetting.find(params[:id])
        if cam.status == "On"
            cam.status ="Off"
        else
            cam.status == "On"
        end
    end
    def set_time
        cam = CameraSetting.find(params[:id])
        if params[:on_time]
        cam.on_time = (params[:on_time])
        end
        if params[:off_time]
        cam.off_time = (params[:off_time])
        end
    end
end
