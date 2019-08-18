class Api::V1::SecurityController < ApplicationController
    def create
        security = Security.new(security_params)
        puts security_params
        if security.save
            render json: security
        else
            render json:{errors: security.errors.full_messages},status: :error
        end
    end
    def index
        security = Security.all
        render json: security
    end
    def user_securities
        user = User.find(params[:id])
        @securities = user.securities
        render json: @securities
    end
    def security_users
        security = Security.find(params[:id])
        @users = security.users
        render json: @users
    end
    private
    def security_params
        params.permit(:company_name,:email,:phone_number,:link,:extra_info,:location,:telegram,:avatar)
    end
end
