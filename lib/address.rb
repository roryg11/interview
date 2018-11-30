require_relative 'geocoding'

class Address
  attr_accessor :lat, :lng, :full_address

  def reverse_geocoded_by
    Geocoder.search([@lat, @lng]).first.address
  end

  def get_coordinates
    Geocoder.search(@full_address)
  end

  def get_distance_from(addressTo, address)
    addressToCoordinates = Geocoder.search(addressTo).first.coordinates
    addressFromCoordinates = Geocoder.search(@address.full_address);
    addressFromCoordinates.distance_to([addressTo.latitude, addressTo.longitude])
  end
end
