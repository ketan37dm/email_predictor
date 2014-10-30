require './email_statistics.rb'

class Domain
  attr_accessor :email_statistics,
                :domain_name,
                :predictions

  def initialize(domain_name)
    @domain_name = domain_name
    @email_statistics = EmailStatistics.new
    @predictions = []
  end

  # This method will learn from the input dataset and gather the  required statistics
  def learn(name, email)
    name_data = learn_name(name)
    email_prefix = get_email_prefix(email)
    match(name_data, email_prefix)
    # puts @email_statistics.inspect
  end

  # This method is responsible for generating predictions for given
  def generate_predictions
    stat_hash = @email_statistics.hashed_statistics
    temp = stat_hash.sort_by{ |k, v| v }
    max_value = temp.last.last
    stat_hash.each{ |k,v| @predictions << k if v == max_value }
    # puts @predictions
    # puts "-" * 30
  end

  # This method will predict the email address for the given inpur
  def display_predictions(name)
    first_name = name.split(" ")[0]
    last_name = name.split(" ")[1]

    puts "Predictions for " + name + " are - "
    @predictions.each do |prediction|
      if (prediction == 'first_name_dot_last_name')
        puts first_name.downcase + "." + last_name.downcase + "@" + @domain_name
      end

      if (prediction == 'first_name_dot_last_initial')
        puts first_name.downcase + "." + last_name[0].downcase + "@" + @domain_name
      end

      if (prediction == 'first_initial_dot_last_name')
        puts first_name[0].downcase + "." + last_name.downcase + "@" + @domain_name
      end

      if (prediction == 'first_initial_dot_last_initial')
        puts first_name[0].downcase + "." + last_name[0].downcase + "@" + @domain_name
      end
    end
    puts "-" * 50
  end

  private 
    def learn_name(name)
      name_data = {}
      name = name.split(" ")
      name_data['first_name'] = name[0].downcase
      name_data['first_name_initial'] = name[0][0].downcase
      name_data['last_name'] = name[1].downcase
      name_data['last_name_initial'] = name[1][0].downcase
      name_data
    end

    def get_email_prefix(email)
      email.split('@')[0]
    end

    def match(name_data, email_prefix)
      first_name = email_prefix.split(".")[0]
      last_name = email_prefix.split(".")[1]

      if (first_name.downcase == name_data['first_name'] && last_name.downcase == name_data['last_name'])
        @email_statistics.first_name_dot_last_name += 1
      end

      if (first_name.downcase == name_data['first_name'] && last_name.downcase == name_data['last_name_initial'])
        @email_statistics.first_name_dot_last_initial += 1 
      end

      if (first_name.downcase == name_data['first_name_initial'] && last_name.downcase == name_data['last_name'])
        @email_statistics.first_initial_dot_last_name += 1
      end

      if (first_name.downcase == name_data['first_name_initial'] && last_name.downcase == name_data['last_name_initial'])
        @email_statistics.first_initial_dot_last_initial += 1
      end
    end
end