require "pry"
class Show < ActiveRecord::Base
    def self.highest_rating
        self.maximum(:rating) 
        #or "rating"
        #Why is this a string?
    end

    def self.most_popular_show
        # Song.where("number_of_stars > ?", 3)
        self.where("? .highest_rating", self)
        self.where("rating = ?", self.highest_rating).first
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.where("rating = ?", self.lowest_rating).first
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > ?", 5)
    end

    def self.shows_by_alphabetical_order
        self.order(:name, :desc)
        # self.order("name", :desc)
    end



end