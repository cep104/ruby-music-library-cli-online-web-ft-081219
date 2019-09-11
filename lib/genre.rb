class Genre 
  require_relative '../lib/concerns/findable'
  extend Concerns::Findable
 attr_accessor :name
  @@all = []
  def initialize(name,genre = nil)
    @name = name 
    @songs = []
    save
  end
  def self.all 
    @@all
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save 
    @@all << self
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def songs
    @songs
  end
  def artists
  @new_array = []
    @songs.collect do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end

end
#rspec spec/003_genre_basics_spec.rb