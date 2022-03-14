class User < ApplicationRecord
  has_many :tests

  def returns_a_list_of_all_tests(difficulty_level_value)
    #that the User passes or has ever passed
    #at this level of difficulty
  end
end
