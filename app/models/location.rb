class Location < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates_numericality_of :latitude, greater_than_or_equal_to: -85, less_than_or_equal_to: 85
  validates_numericality_of :longitude, greater_than_or_equal_to: -180, less_than_or_equal_to: 180

  def self.return_array_with_latitude_and_longitude
    array_with_latitude_and_longitude = []

    Location.all.each do |location|
      array_with_latitude_and_longitude << [location.latitude, location.longitude]
    end
    
    array_with_latitude_and_longitude
  end
end
