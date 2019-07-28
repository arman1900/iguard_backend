class Api::V1::UserController < ApplicationController
    def index
        user = User.all
        render json: user
    end
    def create
        user = User.new(user_params)
        cam = CameraSetting.new  
        if user.save
            cam.user_id = user.id 
            cam.save
            render json: user
        else
            render json:{errors: user.errors.full_messages},status: :error
        end
    end
    private
    def user_params
        params.permit(:login,:email,:name,:surname,:second_name,:password,:password_confirmation,:iin,:telegram,:city,:street,:house,:apartment,:phone_number)
    end
    def correct_user
        unless signed_in?
            render json: {errors: "Sign in first!"}, status: :error
        else
            @user = User.find(params[:id])
            unless current_user?(@user.id)
                render json: {errors: "You are not allowed to edit others"}, status: :error
            end
        end
    end
end
