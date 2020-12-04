#require "jalc_courses/version"

require "pry"
require "nokogiri"
require "open-uri"

module JalcCourses
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./jalc_courses/version"
require_relative "./jalc_courses/cli"
require_relative "./jalc_courses/courses"
require_relative "./jalc_courses/scraper"
