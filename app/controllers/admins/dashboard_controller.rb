class Admins::DashboardController < ApplicationController
  before_action :authentication
  before_action :is_admin?
  layout"admins/base"
  def index
  end
end
