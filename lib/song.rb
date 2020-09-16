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
    song_array = name.split
    passed_breaker = false
    name = ""
    artist = ""
    song_array.each do |value|
      if value == "-"
        passed_breaker = true
      end
      if passed_breaker == false
        artist = value
      else
        if value != "-"
        name += value + " "
        end
      end
    end
    name = name.delete_suffix(".mp3 ")
    @song = self.new
    @song.name = name
    @song.artist_name = artist
    @song
  end
  def self.create_from_filename(name)
    song_array = name.split
    passed_breaker = false
    name = ""
    artist = ""
    song_array.each do |value|
      if value == "-"
        passed_breaker = true
      end
      if passed_breaker == false
        artist = value
      else
        if value != "-"
        name += value + " "
        end
      end
    end
    name = name.delete_suffix(".mp3 ")
    @song = self.create
    @song.name = name
    @song.artist_name = artist
    @song
  end
  def self.destroy_all
    self.all = []
  end









end
