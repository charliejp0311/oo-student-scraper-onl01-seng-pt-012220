require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    page = open(index_url)
    scrape = Nokogiri::HTML(page)
    scrape.css('.student-card').each do |student|
      students << {:location => student.css('.student-location').text,
                    :name => student.css('h4.student-name').text,
                    :profile_url => student.css('a').attribute('href').value
                  }
    end
    students

  end

  def self.scrape_profile_page(profile_url)
    profile = {}
    l = nil
    g = nil
    q = nil
    b = nil
    profile_page = open(profile_url)
    profile_scrape = Nokogiri::HTML(profile_page)
    l = profile_scrape.css('a').select{|a| a.attribute('href').value.match(/linkedin/)}.attribute('href').value
    profile = {
      :linkedin => nil,
      :github => nil,
      :profile_quote => nil,
      :bio => nil
    }
    binding.pry
    profile
  end

end
