class EmailStatistics
  attr_accessor :first_name_dot_last_name,
                :first_name_dot_last_initial,
                :first_initial_dot_last_name,
                :first_initial_dot_last_initial

  def initialize
    @first_name_dot_last_name = 0
    @first_name_dot_last_initial = 0
    @first_initial_dot_last_name = 0
    @first_initial_dot_last_initial = 0
  end

  def hashed_statistics
    stat_hash = {}
    stat_hash['first_name_dot_last_name'] = @first_name_dot_last_name
    stat_hash['first_name_dot_last_initial'] = @first_name_dot_last_initial
    stat_hash['first_initial_dot_last_name'] = @first_initial_dot_last_name
    stat_hash['first_initial_dot_last_initial'] = @first_initial_dot_last_initial
    stat_hash
  end
end