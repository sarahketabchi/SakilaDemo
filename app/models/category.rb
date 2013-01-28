class Category < ActiveRecord::Base
  set_table_name(:category)
  set_primary_key(:category_id)

  has_many :film_categories
  has_many :films, :through => :film_categories
  has_many :film_actors, :through => :films
  has_many :actors, :through => :film_actors

  def self.most_popular_category
    self
      .joins(:films)
      .order("COUNT(*) DESC")
      .first
  end


  # def self.num_of_films_per_category(customer)
  #   self
  #   .select("category.*, COUNT(*) AS num_films")
  #   .joins(:films)
  #   .where("film.customers LIKE #{customer}")
  #   .group("category_id")

  # end

  # def self.most_rented
    
  # end
end