require_relative 'geocoding'

class Address
  attr_accessor :lat, :lng, :full_address

  def reverse_geocoded_by(lat, lng)
    Geocoder.search([lat, lng]).first.address
  end

  def get_coordinates(address)
    Geocoder.search(address)
  end

  def get_distance_from(addressTo, address)
    addressToCoordinates = Geocoder.search(addressTo).first.coordinates
    addressFromCoordinates = Geocoder.search(address.full_address);
    addressFromCoordinates.distance_to([addressTo.latitude, addressTo.longitude])
  end
end
