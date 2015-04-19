class Jobseeker

attr_reader :prefix, :title, :first_name, :last_name, :email, :phone_number, :company_name

  def initalize(hash)
    @first_name=hash["first_name"]
    @last_name=hash["last_name"]
    @email=hash["email"]
  end

  def fullname
    return "#{@prefix} #{@first_name} #{@last_name}"
  end
 
 def self.find(id)
  jobseeker_hash=Unirest.get("localhost:3000/employees/#{id}.json ").body
  @jobseeker= []
  jobseeker_array.each do |employee_hash|
   return Jobseeker.new(jobseeker_hash)
  end
  #def first_name
  #  return @first_name
 # end

  #def last_name
 #   return @last_name
 # end

 # def email
 #   return @email
 # end
end