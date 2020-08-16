class ApplicationController < ActionController::Base
	before_action :go_login
	include SessionsHelper
end
