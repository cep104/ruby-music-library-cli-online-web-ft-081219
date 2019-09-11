class MusicImporter
  attr_accessor :file_path
  def initialize(path)
  @path = path
end

  def path 
    @path
  end
  
  def files 
     file_names = Dir.glob(@path+"/*.mp3").map{ |file| file.gsub("#{@path}/","") }
  end
  
  def import()
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end