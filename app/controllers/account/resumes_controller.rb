class Account::ResumesController < ApplicationController
  before_action :authenticate_user!
  layout "history"

  def index
    @user = current_user
    @resumes = Resume.where(:user_id => @user).paginate(:page => params[:page], :per_page => 10)
  end

end
