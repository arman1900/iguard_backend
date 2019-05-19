class Api::V1::UserController < ApplicationController
    def create
        user = User.new(user_params)
        puts user_params
        if user.save
            render json: user
        else
            render json:{errors: user.errors.full_messages},status: :error
        end
    end
    private
    def user_params
        params.permit(:login,:email,:name,:surname,:second_name,:password,:password_confirmation,:iin,:telegram,:city,:street,:house,:apartment)
    end
end
