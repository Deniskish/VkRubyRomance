class SchoolClass < ApplicationRecord
    has_many :students, foreign_key: :class_id
  end
  