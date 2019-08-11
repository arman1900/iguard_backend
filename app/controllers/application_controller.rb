class ApplicationController < ActionController::Base
    before_action :check_token
    before_action :set_csrf_cookie
    skip_before_action :verify_authenticity_token
    include Api::V1::CameraSettingsHelper
    include Api::V1::SessionHelper
    private
    def check_token
        unless Developer.find_by(token: params[:token])
            render json: {errors: "Incorrect Token"}, status: :error
        end
    end
    def set_csrf_cookie
        cookies["CSRF-TOKEN"] = form_authenticity_token
    end
end
