class Api::V1::SessionController < ApplicationController
    def create
        if signed_in?
            render json: {errors: "Sign out from account first!!!"}, status: :error
        else
            login = session_params[:username]
            if login.to_s.include? "@"
                user = User.find_by_email(login)
            else
                user = User.find_by_login(login)
            end
            if user && user.authenticate(session_params[:password])
                #if user.email_confirmed
                    sign_in user    
                    if params[:remember_me] == '1' 
                        remember user
                    else
                        forget user
                    end
                    render json: user
                #else
                   # render json: {errors: "Account not activated"}, status: :error
                #end
            else
                render json: {errors: "Invalid username, email or password"}, status: :error
            end
        end
    end
    def destroy
        if current_user = params[:id]
            sign_out
            render json: {success: "Successfully signed out"}
        else
        render json: {errors: "Not Signed In"}, status: :error   
        end 
    end 
    def show
        if current_user
            render json: current_user
        else
            render json: {errors: "Not Signed In"}, status: :error
        end
    end
    private
    def session_params
        params.permit(:username, :password)
    end
end
