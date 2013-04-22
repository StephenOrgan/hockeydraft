require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'open-uri'

class NhlScrape

URL = "http://www.nhl.com/ice/playerstats.htm?viewName=summary&season=20112012&sort=points&pg="

#URL = "http://www.nhl.com/ice/playerstats.htm?season=20112012&gameType=2&team=&position=G&viewName=summary&pg="

  attr_reader :player_count, :pages, :season, :datestamp



  def initialize(season=20112012)
    @season     = season.to_i
    @pages      = count_pages
    @datestamp  = Time.now.strftime('%Y%m%d')
    FileUtils.mkpath("cache/#{season}/html")
  end

  def count_pages
    page = download_page(1, false)
    page.link_with(:text => 'Last').href.match(/\d{1,2}$/)[0].to_i
  end


  def cache_html(number, page)
    puts page
    File.open("cache/#{season}/html/#{datestamp}-#{number}.html", 'w') { |f| f.write(page) }
  end

  def download_all
    (1..pages).each do |pg|
      download_page(pg+1)
    end
  end

  def download_page(number=1, cache=false)
    
    mech = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
    page = mech.get(URL.gsub(/YYYY/,season.to_s)+number.to_s)
    # TODO handle http errors, e.g.: Mechanize::ResponseCodeError: 500 => Net::HTTPInternalServerError
    cache_html(number, page.content) if cache
    page
  end

  def parse_all
    #File.open("cache/#{season}/playerstats.csv", 'w') do |f|
    File.open("cache/#{season}/goaliestats.csv", 'w') do |f|
      (1..pages).each do |pg|
        f << parse_page(pg)
        f << "\n"
      end
    end
  end

  def parse_page(number=1)
    #download_page(number) unless File.exists?("cache/#{season}/html/#{datestamp}-#{number}.html")
    #file = File.read("cache/#{season}/html/#{datestamp}-#{number}.html")
    html = Nokogiri::HTML(open("http://www.nhl.com/ice/playerstats.htm?viewName=summary&season=20112012&sort=points&pg=#{number}"))
    #html = Nokogiri::HTML(open("http://www.nhl.com/ice/playerstats.htm?season=20112012&gameType=2&team=&position=G&viewName=summary&pg=#{number}"))
    table = html.css('table.data.stats tbody tr')
    players = []
    table.each_with_index do |row,index|
      player = []
      player << row.search('a').first['href'].match(/\/ice\/player.htm\?id=(\d+)/)[1]
      row.css('td').each do |col|
        data = col.content.gsub(/\n|\t/,'')
        player << data unless data.empty?
      end
      players << '"' + player.join('","') + '"'
    end
    players.join("\n")
  end

end