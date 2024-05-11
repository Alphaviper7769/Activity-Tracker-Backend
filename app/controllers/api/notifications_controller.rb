module Api
    class NotificationsController < ApplicationController
      
        def index
            user_notifications = Notification.where(user_id: params[:user_id])
            render json: user_notifications, status: :ok
        end

        def remove_notification
            notification = Notification.find_by(id: params[:id])
            if notification
              notification.destroy
              head :ok
            else
              render json: { error: 'Notification not found' }, status: :not_found
            end
        end

        def check_notification
            notification = Notification.find_by(user_id: params[:user_id], website_id: params[:website_id])
            if notification
              render json: { time: notification.duration, message: notification.message }, status: :ok
            else
              render json: { message: 'No notification found for the user and website' }, status: :not_found
            end
        end

        def add_notification
            notification = Notification.new(notification_params)
            if notification.save
              render json: notification, status: :created
            else
              render json: { errors: notification.errors.full_messages }, status: :unprocessable_entity
            end
        end
      
          private
      
        def notification_params
            params.permit(:user_id, :website_id, :duration, :message)
        end

    end
  end