require './domain.rb'

class Main
  def initialize(input)
    @input_dataset = input
  end

  # This method will analyze the input data set
  def analyze_data
  end

  # This method delas with prediction of the email for the test_dataset
  def predict_emails
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



main = Main.new
main.analyze_data
main 