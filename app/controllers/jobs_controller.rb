class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

   before_action :validate_search_key, only: [:search]

  def index

    if params[:category].present?
        @category = params[:category]
        if @category == t('th_all')
          @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 5)
        else
          @jobs = Job.where(:is_hidden => false, :category => @category).recent.paginate(:page => params[:page], :per_page => 5)
        end
    else
      @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 5)
    end


  end
=begin
    @jobs = case params[:order]
            when 'by_company'
              Job.published.company.paginate(:page => params[:page], :per_page => 15)
            when 'by_category'
              Job.published.category.paginate(:page => params[:page], :per_page => 15)
            when 'by_lower_bound'
              Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 15)
            when 'by_upper_bound'
              Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 15)
            else
              Job.published.recent.paginate(:page => params[:page], :per_page => 15)
            end
=end



  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job has been archived already."
      redirect_to root_path
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to jobs_path
  end

  # search
  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.recent.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden, :city, :company, :category)
  end

  protected
  def validate_search_key
    @query_string = params[:q]
    if params[:q].present?
      @search_criteria =  {
        title_or_company_or_city_cont: @query_string
      }
    end
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

end
