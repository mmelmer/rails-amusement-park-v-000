class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    
    sick = (self.user.nausea + self.attraction.nausea_rating)
    happy = (self.user.happiness + self.attraction.happiness_rating)  
    tix = (self.user.tickets - self.attraction.tickets)
    if (self.user.height < self.attraction.min_height) || (self.user.tickets < self.attraction.tickets)
      "Sorry." + "#{enough_tickets?}" + "#{tall_enough?}"
    else
      self.user.update(:tickets => tix, :nausea => sick, :happiness => happy)
      "Thanks for riding the #{attraction.name}!"
    end

  end
  
  def tall_enough?
    self.user.height >= self.attraction.min_height ? "" : " You are not tall enough to ride the #{attraction.name}."
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets ? "" : " You do not have enough tickets to ride the #{attraction.name}."
  end



end
