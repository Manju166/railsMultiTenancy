class HomeController < ApplicationController
  def index
    if params[:organization_id].present?
      @selected_organization = Organization.find(params[:organization_id])
    else
      @selected_organization = nil
    end
  end

  def dashboard
  end
end
