class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    render inline: "<h1>Hello</h1><p>from Microservice A.</p>"
  end
end
