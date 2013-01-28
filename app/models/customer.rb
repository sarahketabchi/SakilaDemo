class Customer < ActiveRecord::Base
  set_table_name(:customer)
  set_primary_key(:customer_id)

  has_many :rentals
  has_many :inventories, :through => :rentals
  has_many :films, :through => :inventories
  # has_many :categories, :through => :films

  def self.watched_most_films
    self
      .joins(:films)
      .group(:customer_id)
      .order("COUNT(DISTINCT(film.film_id)) DESC")
      .first
  end

  # def self.num_of_films_per_category
  #   categories
  #   .select("category.*, COUNT(*) AS num_films")
  #   .joins(:films)
  #   .group("category_id")

  # end


end