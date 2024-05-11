module Api
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { user: user }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      def destroy
        session.delete(:user_id)
        render json: {}, status: :ok
      end
      
    end
  end