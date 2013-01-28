class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :actors, :through => :film_actor
  has_many :categories, :through => :film_category


end