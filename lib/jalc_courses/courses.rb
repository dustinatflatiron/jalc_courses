require_relative "version.rb"
require_relative "scraper.rb"
require 'pry'

  class JalcCourses::Courses 
    attr_accessor :date, :title, :description, :instructor
    @@all = []

    def initialize(date, title, description, instructor)
      @date = date
      @title = title
      @description = description
      @instructor = instructor
      @@all << self
    end

    def self.all
      @@all.slice(1,9)
    end

    def self.display_courses
      self.all.each.with_index(1) do |name, i|
        puts "#{i}:  #{name.title}"
      end
    end

  end

