class Student < ApplicationRecord
    belongs_to :school_class, foreign_key: :class_id, optional: false
  
    before_create :generate_auth_token
  
    private
  
    def generate_auth_token
      salt = "secret_salt"
      self.auth_token = Digest::SHA256.hexdigest("#{id}#{salt}#{Time.now.to_i}")
    end
  end
  require 'digest'
