class Country < ActiveRecord::Base
  set_table_name(:country)
  set_primary_key(:country_id)

  has_many :cities
  has_many :addresses, :through => :cities
  has_many :stores, :through => :addresses
  has_many :inventories, :through => :stores


  def self.most_popular_actor
    self
      .joins(:inventories => :rentals)
      .group()
  end

end