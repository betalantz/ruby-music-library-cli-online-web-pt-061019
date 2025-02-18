class Genre
    extend Concerns::Findable
  
    attr_accessor :name
    attr_reader :songs
  
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def self.all
      @@all
    end
  
    def self.destroy_all
      all.clear
    end
  
    def save
      self.class.all << self
    end
  
    def self.create(name)
      genre = new(name)
      genre.save
      genre
  
      # Or, as a one-liner:
      # new(name).tap{ |a| a.save }
    end
  
    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end
  
    def artists
      songs.collect{ |s| s.artist }.uniq
    end
  end
  