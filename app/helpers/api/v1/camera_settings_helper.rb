module Api::V1::CameraSettingsHelper
    def status_state
        status=0
        CameraSetting.where(user_id: params[:user_id]).all.each do |cam|
            if cam.status == "On" 
                status=1 
            end
        end
        status
    end
end
