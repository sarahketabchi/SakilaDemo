class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :film_actors
  has_many :film_categories

  has_many :actors, :through => :film_actors
  has_many :categories, :through => :film_categories

  def self.largest_cast
    self
      .joins(:actors)
      .group(:film_id)
      .order("COUNT(*) DESC")
      .first
  end

  def self.more_than_one_category
    self
    .joins(:categories)
    .group(:film_id)
    .having("COUNT(*) > 1")
  end

end