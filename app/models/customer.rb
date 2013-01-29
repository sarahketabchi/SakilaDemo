class Customer < ActiveRecord::Base
  set_table_name(:customer)
  set_primary_key(:customer_id)

  has_many :rentals
  has_many :inventories, :through => :rentals
  has_many :films, :through => :inventories

  def self.watched_most_films
    self
      .joins(:films)
      .group(:customer_id)
      .order("COUNT(DISTINCT(film.film_id)) DESC")
      .first
  end

  def self.num_of_films_per_category
    self
    .select("customer.customer_id, film_category.category_id AS category, COUNT(*) AS num_films")
    .joins(:films => :film_categories)
    .group("customer.customer_id, category_id")

  end


end