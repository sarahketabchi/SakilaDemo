class Country < ActiveRecord::Base
  set_table_name(:country)
  set_primary_key(:country_id)

  has_many :cities
  has_many :addresses, :through => :cities
  has_many :stores


end