# app/controllers/api/reports_controller.rb
module Api
    class ReportsController < ApplicationController
      def daily
        generate_report(:daily)
      end
  
      def weekly
        generate_report(:weekly)
      end
  
      private
  
      def generate_report(report_type)
        start_date, end_date = calculate_date_range(report_type)
        categories = %w[distracting productive entertainment] # Example categories
  
        report_data = {}
        categories.each do |category|
          sites_visited = Summary.where(user_id: params[:user_id], Notiftime: start_date..end_date, category: category).count
          total_time = Summary.where(user_id: params[:user_id], Notiftime: start_date..end_date, category: category).sum(:duration)
  
          report_data[category] = {
            sites_visited: sites_visited,
            total_time_spent: total_time
          }
        end
  
        render json: report_data, status: :ok
      end
  
      def calculate_date_range(report_type)
        case report_type
        when :daily
          start_date = Date.today.beginning_of_day
          end_date = start_date - 1.day
        when :weekly
          start_date = Date.today.beginning_of_week
          end_date = start_date - 1.week
        end
  
        [start_date, end_date]
      end
    end
  end
  