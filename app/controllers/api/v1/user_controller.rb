class Api::V1::UserController < ApplicationController
    before_action :correct_user, only: [:update,:delete]
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
            sign_out
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
            if user.update_attributes(user_params)
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
