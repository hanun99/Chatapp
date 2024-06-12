class ApplicationController < ActionController::Base
    # Your application controller methods here
    protect_from_forgery unless: -> { request.format.json? }
    #skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
  end