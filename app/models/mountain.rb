class Mountain < ActiveRecord::Base
  belongs_to :user
  
  def initialize(name, elevation)
    @mountains << self
  end
end