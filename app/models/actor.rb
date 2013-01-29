class Actor < ActiveRecord::Base
  set_table_name(:actor)
  set_primary_key(:actor_id)

  has_many :film_actors

  has_many :films, :through => :film_actors
  has_many :film_categories, :through => :films
  has_many :categories, :through => :film_categories

  has_many :rentals, :through => :films


  def self.most_films
    self
    .joins(:films)
    .group("actor.actor_id")
    .order("COUNT(*) DESC")
    .first
  end

  def self.longest_career
    #We dont order it or anything because all films were released in 2006
    #And all career lengths are 0.
    self
    .select("actor.*, (MAX(film.release_year) - MIN(film.release_year)) AS career_length")
    .joins(:films)
    .group("actor_id")
  end

end