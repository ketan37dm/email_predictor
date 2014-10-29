require './email_statistics.rb'

class Domain
  def initialize(domain_name)
    @domain_name = domain_name
    @email_statistics = EmailStatistics.new
  end

  # This method will predict the email address for the given inpur
  def predict(input)
    
  end
end