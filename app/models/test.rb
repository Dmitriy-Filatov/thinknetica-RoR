class Test < ApplicationRecord
  belongs_to :category

  def self.returns_array_of_titles_of_all_tests(category_name)
    #sorted_in_descending_order
  end
end
