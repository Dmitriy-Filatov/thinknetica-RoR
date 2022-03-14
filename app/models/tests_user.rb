class TestsUser < ApplicationRecord
  belongs_to :test, foreign_key: :test_id
  belongs_to :user, foreign_key: :user_id
end
