class Mountain < ActiveRecord::Base
  has_many :summits
  has_many :users, through: :summits
end