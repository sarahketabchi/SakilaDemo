class Country < ActiveRecord::Base
  set_table_name(:country)
  set_primary_key(:country_id)

  has_many :cities
  has_many :addresses, :through => :cities
  has_many :stores, :through => :addresses


  def self.most_popular_actor
    self
      .select("country.country, actor.actor_id AS actor_obj, COUNT(*) AS num_rentals")
      .joins(:stores => {:rentals => :actors})
      .group("actor.actor_id")
      .order("COUNT(*) DESC")
      .first
  end

end