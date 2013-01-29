class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)

  has_many :film_actors
  has_many :film_categories
  has_many :actors, :through => :film_actors
  has_many :categories, :through => :film_categories

  has_many :inventories
  has_many :stores, :through => :inventories
  has_many :rentals, :through => :inventories
  has_many :customers, :through => :rentals

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

  def self.in_most_stores
    self
      .select("film.title, COUNT(DISTINCT(store.store_id)) AS num_stores")
      .joins(:stores)
      .group("film.film_id")
      .order("COUNT(DISTINCT(store.store_id)) DESC")
      .first
  end

  def self.has_most_inventory
    self
      .select("film.title, COUNT(*) AS inventory_amt")
      .joins(:inventories)
      .group("film.film_id")
      .order("COUNT(*) DESC")
  end

  def self.most_rented
    self
      .joins(:customers)
      .group(:film_id)
      .order("COUNT(*) DESC")
      .first
  end

  def self.most_customers
    self
      .joins(:customers)
      .group(:film_id)
      .order("COUNT(DISTINCT(customer.customer_id)) DESC")
      .first
  end

  # def self.category_distribution
  #   self
  #   .select("category, COUNT(film) AS num_films")
  #   .joins(:categories)
  #   .
  # end

end