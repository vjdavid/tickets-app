class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from StandardError do |exception|
    binding.pry
  end
end
