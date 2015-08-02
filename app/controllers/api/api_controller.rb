class Api::ApiController < ApplicationController
  
  before_action :doorkeeper_authorize!
    
	rescue_from ActiveRecord::RecordNotFound do
      render json: {status: 'error'}, status: :not_found
    end

	  def render_error(http_status: 400, messages: nil)
	    resp = {status: 'error'}
	    resp[:messages] = messages if messages
	    render json: resp, status: http_status
	  end
end