class Artist 
  require_relative '../lib/concerns/findable'
  extend Concerns::Findable
  
  attr_accessor :name, :genre
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
    save
  end
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(name)
    self.new(name)
  end
  
 def songs 
    @songs
  end
 def add_song(song) 
  if song.artist != self
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
  end
  
  def genres 
    @new_array = []
    @songs.collect do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
  end
end
#rspec spec/002_artist_basics_spec.rb