class Backend::ApplicationController < ApplicationController
  before_filter :authenticate
  
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "<%= username %>" && password == "<%= password %>"
    end
  end
end