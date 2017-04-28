class Account::JobsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @jobs = current_user.starred_jobs.recent.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @job = Job.find(params[:id])
  end

  # star & unstar
  def star
    @job = Job.find(params[:id])

    if !current_user.is_follower_of?(@job)
      current_user.star!(@job)
    end

    redirect_to :back
  end

  def unstar
    @job = Job.find(params[:id])

    if current_user.is_follower_of?(@job)
      current_user.unstar!(@job)
    end

    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :city, :company, :category)
  end

end
