class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.create
    song = self.new
    song.name = name
    @@all << song
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
     song = self.new
    song.name = name
    @@all << song
    song
  end
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else self.create_by_name(name)
      end
  end
  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end
  def self.new_from_filename(song)
    row = song
    data = row.split(" - ")
    artist_name = data[0]
    song_name = data[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end 
  def self.create_from_filename(song)
    self.new_from_filename(song)
    song.save
    song
  end
  def save
    self.class.all << self
  end
  def self.destroy_all
    self.all.clear
  end
end
