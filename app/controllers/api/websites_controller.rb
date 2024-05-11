module Api
    class WebsitesController < ApplicationController


      def index
        websites = Website.all
        render json: websites, status: :ok
      end

      def create
        website = Website.new(website_params)
        if website.save
          render json: website, status: :created
        else
          render json: { errors: website.errors.full_messages }, status: :unprocessable_entity
        end
      end



      def destroy
        website = Website.find_by(id: params[:id])
        if website
          website.destroy
          head :ok
        else
          render json: { error: 'Website not found' }, status: :not_found
        end
      end
  
      private
  
      def website_params
        params.permit(:url, :category)
      end


      


    end
  end