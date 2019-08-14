class Api::V1::UserController < ApplicationController
    before_action :is_admin, only: [:delete]
    def index
        user = User.all
        render json: user
    end
    def delete
        begin
            user = User.find(params[:id])
        rescue
            render json: {errors: "User does not exist"}, status: :error
        ensure
            if user.destroy!
                render json: {success: "Deleted Successfully"}
            else
                render json: {errors: user.errors.full_messages}, status: :error
            end
        end
    end
    def update
        begin
            user = User.find(params[:id])
        rescue
            render json: {errors: "User does not exist"}, status: :error
        ensure
            if user.update_attributes(update_params)
                render json: user
            else
                render json: {errors: user.errors.full_messages}, status: :error
            end
        end
    end
    def create
        user = User.new(user_params)
        if user.save
            cam = CameraSetting.new  
            cam.user_id = user.id 
            cam.save
            render json: user
        else
            render json:{errors: user.errors.full_messages},status: :error
        end
    end
    private
    def user_params
        params.permit(:login,:email,:name,:surname,:second_name,:password,:password_confirmation,:iin,:telegram,:city,:street,:house,:apartment,:phone_number,:is_admin)
    end
    def update_params
        params.permit(:email,:name,:surname,:second_name,:iin,:telegram,:city,:street,:house,:apartment,:phone_number)
    end
    def correct_user
        if current_user = params[:id]
            @user = User.find(params[:id])
        else
            render json: {errors: "You are not allowed to edit others"}, status: :error
        end
    end
    def is_admin
        if signed_in?
            if(current_user.is_admin == false)
                render json: {errors: "You don't have an access"}, status: :error
            end
        else
            render json: {errors: "You don't have an access"}, status: :error
        end
    end
end
