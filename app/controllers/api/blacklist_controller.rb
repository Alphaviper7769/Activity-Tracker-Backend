module Api
    class BlacklistController < ApplicationController


      def index
        user_blacklist = Blacklist.where(user_id: params[:user_id])
        render json: user_blacklist, status: :ok
      end

      def add_to_blacklist
        website = find_or_create_website(params[:website_name])
        blacklist_entry = Blacklist.new(user_id: params[:user_id], website_id: website.id, duration: params[:duration])
        if blacklist_entry.save
          render json: blacklist_entry, status: :created
        else
          render json: { errors: blacklist_entry.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def remove_from_blacklist
        blacklist_entry = Blacklist.find_by(id: params[:id])
        if blacklist_entry
          blacklist_entry.destroy
          head :ok
        else
          render json: { error: 'Blacklist entry not found' }, status: :not_found
        end
      end

      def check_blacklist
        blacklist_entry = Blacklist.find_by(user_id: params[:user_id], website_id: find_website(params[:website_name]))
        if blacklist_entry
          render json: { time: blacklist_entry.duration }, status: :ok
        else
          render json: { time: -1 }, status: :ok
        end
      end
  
      private
  
      def blacklist_params
        params.permit(:user_id, :website_name, :duration)
      end
      
      def find_or_create_website(website_name)
        website = Website.find_by(url: website_name)
        return website if website
      
        # If website does not exist, create a new one
        new_website = Website.create(url: website_name,category: 2)
        return new_website
      end

      def find_website(website_name)
        website = Website.find_by(url: website_name)
        puts website
        return website if website
        return -1
      end

    end
end