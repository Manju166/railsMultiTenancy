class HomeController < ApplicationController
  before_action :authenticate_user! 

  def index
  end

  def dashboard
    @organization = current_user.organization
    @posts = @organization.posts
  end
end