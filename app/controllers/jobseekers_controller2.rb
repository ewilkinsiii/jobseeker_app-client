class JobseekersController < ApplicationController
  def index
    jobseekers_array=Unirest.get("#{ENV[API_BASE_URL]}employees.json").body
    @jobseekers=Jobseeker.new()
  end

  def show
    @jobseeker=Jobseeker.find(params[:id])
  end

  def new
    
  end

  def create
    @jobseekers=Unirest.post("#{ENV[API_BASE_URL]}employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:prefix => params[:prefix], :first_name => params[:first_name], :last_name => params[:last_name], :company_name => params[:company_name], :title => params[:title]}).body
    redirect_to jobseekers_path(@jobseekers["id"])
  end
end
