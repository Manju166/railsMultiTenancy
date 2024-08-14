class HomeController < ApplicationController
  before_action :authenticate_user! 

  def index
  end

  def dashboard
    @organization = current_user.organization
  end
end