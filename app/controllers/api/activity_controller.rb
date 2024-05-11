module Api
    class ActivityController < ApplicationController


      def log_activity
        website = find_or_create_website(params[:website_name])
        activity = Log.new(user_id: params[:user_id], website_id: website.id, duration: params[:duration])
        if activity.save
          render json: activity, status: :created
        else
          render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      def activity_summary
        user_logs = Log.where(user_id: params[:user_id])
        if user_logs.any?
          activity_summaries = user_logs.select('website_id, duration, created_at')
          render json: activity_summaries, status: :ok
        else
          render json: { error: 'No activity logs found for the user' }, status: :not_found
        end
      end
      


      private
  
      def find_or_create_website(website_name)
        website = Website.find_by(url: website_name)
        return website if website
  
        # If website does not exist, create a new one
        new_website = Website.create(url: website_name,category: 1)
        return new_website
      end
    end
  end