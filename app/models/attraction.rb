class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
  #attr_accessor :name, :tickets
end
