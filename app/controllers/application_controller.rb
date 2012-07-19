class ApplicationController < ActionController::Base
  protect_from_forgery

  include AuthenticatedSystem
  helper :all
end