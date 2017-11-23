class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  attr_accessor :message


  def mood
    if self.happiness && self.nausea
      self.nausea < self.happiness ? "happy" : "sad"
    end
  end

end
