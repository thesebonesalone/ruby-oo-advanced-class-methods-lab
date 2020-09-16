class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def self.all=(value)
    @@all = value
  end


  def save
    self.class.all << self
  end



  def self.create
  @song = self.new
  self.all.push(@song)
  @song
  end
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end
  def self.create_by_name(name)
    @song = self.create
    @song.name = name
    @song
  end
  def self.find_by_name(name)
    self.all.find { |i| i.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by { |value| value.name}
  end
  def self.new_from_filename(name)
    song_array = name.split(" - ")
    @song = self.new
    @song.name = song_array[1].delete_suffix(".mp3")
    @song.artist_name = song_array[0]
    @song
  end
  def self.create_from_filename(name)
    song_array = name.split(" - ")
    @song = self.create
    @song.name = song_array[1].delete_suffix(".mp3")
    @song.artist_name = song_array[0]
    @song
  end
  def self.destroy_all
    self.all = []
  end









end
