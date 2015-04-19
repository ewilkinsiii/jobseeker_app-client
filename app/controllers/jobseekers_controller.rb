class JobseekersController < ApplicationController
  def index
    jobseekers_array=Unirest.get("localhost:3000/employees.json").body
    @jobseekers=Jobseeker.new()
  end

  def show
    jobseeker_hash=Unirest.get("localhost:3000/employees/#{params[:id]}.json ").body
    @jobseeker= []
    jobseeker_array.each do |employee_hash|
      @jobseeker << Jobseeker.new(jobseeker_hash)
    end
  end

  def new
    
  end

  def create
    @jobseekers=Unirest.post("localhost:3000/employees.json", :headers => {"Accept" => "application/json"}, :parameters => {:prefix => params[:prefix], :first_name => params[:first_name], :last_name => params[:last_name], :company_name => params[:company_name], :title => params[:title]}).body
    redirect_to jobseekers_path(@jobseekers["id"])
  end
end