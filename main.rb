require './domain.rb'

class Main
  def initialize(input, test)
    @input_dataset = input
    @test_dataset = test
    @all_domains = {}  # This hash will keep track of all the available domains from the input_dataset
  end

  # This method will analyze the input data set
  def analyze_data
    @input_dataset.each do |name, email|
      domain_name = find_domain(email)
      current_domain = get_current_domain(domain_name) 
      current_domain.learn(name, email)
    end

    # Generate predictions for available domains
    @all_domains.each{ |key, domain| domain.generate_predictions }
    
    # display_info
  end

  # This method delas with prediction of the email for the test_dataset
  def predict_emails
    @test_dataset.each do |test_item|
      domain_name = test_item[1]
      if !@all_domains.keys.include?(domain_name)
        puts "Can not predict email for this domain as no sufficient information is available"
      else
        current_domain = get_current_domain(domain_name) 
        current_domain.predict(test_item[0])
      end
    end
  end

  private 
    def find_domain(email)
      email.split('@').last
    end

    def get_current_domain(domain_name)
      if @all_domains.keys.include?(domain_name)
        current_domain = @all_domains[domain_name]
      else
        current_domain = Domain.new(domain_name)
        @all_domains[domain_name] = current_domain
      end
      current_domain
    end

    # Utility method to disply email statistics per domain
    def display_info
      @all_domains.each do |key, domain|
        puts "Domain : " + domain.domain_name
        puts domain.email_statistics.inspect
        puts "*" * 80
      end
    end
end


# This is the input dataset to the algorithm
# I am assuming the structure of the input dataset as follows : 
# It is a hash where 'key' is the name of the person and 'value' is his email address
input_dataset = {
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}


# This is the test dataset to the algorithm
# I am assuming the structure of the input dataset as follows : 
# Its an array of arrays where each element of the outer array is an array consisting of 2 elements
# outer_array = [ ['Name', 'Domain'], ['Name', 'Domain'], ['Name', 'Domain'], .... ]
test_dataset = [
  ["Peter Wong", "alphasights.com"],
  ["Craig Silverstein", "google.com"],
  ["Steve Wozniak", "apple.com"],
  ["Barack Obama", "whitehouse.gov"]
]



main = Main.new(input_dataset, test_dataset)
main.analyze_data
main.predict_emails 