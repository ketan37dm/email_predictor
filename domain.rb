require './email_statistics.rb'

class Domain
  attr_accessor :email_statistics,
                :domain_name,
                :predictions

  def initialize(domain_name)
    @domain_name = domain_name
    @email_statistics = EmailStatistics.new
  end

  # This method will learn from the input dataset and gather the  required statistics
  def learn(name, email)
    name_data = learn_name(name)
    email_prefix = get_email_prefix(email)
    match(name_data, email_prefix)
    # puts @email_statistics.inspect
  end

  def generate_predictions
    stat_hash = @email_statistics.hashed_statistics
    puts @domain_name + " " + stat_hash.to_s
  end

  # This method will predict the email address for the given inpur
  def predict(input)

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

      if (first_name.downcase == name_data['first_name_initial'] && last_name.downcase == name_data['last_name'])
        @email_statistics.first_initial_dot_last_initial += 1
      end
    end
end