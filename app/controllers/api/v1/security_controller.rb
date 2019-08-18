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
    def show_security_users
    private
    def security_params
        params.permit(:company_name,:email,:phone_number,:link,:extra_info,:location,:telegram,:picture)
    end
end
