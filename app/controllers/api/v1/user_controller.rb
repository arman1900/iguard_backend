class Api::V1::UserController < ApplicationController
    def create
        user = User.new(user_params)
        cam = Camera_setting.new
        cam.user_id = user.id
        puts user_params
        if user.save
            render json: user, only: [:login,:email,:id,:telegram]
        else
            render json:{errors: user.errors.full_messages},status: :error
        end
    end
    private
    def user_params
        params.permit(:login,:email,:name,:surname,:second_name,:password,:password_confirmation,:iin,:telegram,:city,:street,:house,:apartment,:phone_number)
    end
end
