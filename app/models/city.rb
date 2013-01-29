class City < ActiveRecord::Base
  set_table_name(:city)
  set_primary_key(:city_id)

  belongs_to :country
  has_many :addresses

  has_many :stores, :through => :addresses

  def self.num_rentals_per_city
    self
      .select("city.city, COUNT(*) AS num_rentals")
      .joins(:stores => :rentals)
      .group("city.city_id")
  end


end