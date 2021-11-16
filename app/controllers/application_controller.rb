class ApplicationController < ActionController::Base
  # May have to check for specific pages
  # This line of code will send a non-user to the login page
  # before_action :authenticate_member!
end
