class Api::ApiController < ApplicationController
    
	rescue_from ActiveRecord::RecordNotFound do
      render json: {status: 'error'}, status: :not_found
    end

    def render_error(http_status = 400)
      render json: {status: 'error'}, status: http_status
    end
end