# beer_song.rb
class BeerSong
  attr_accessor :lyrics
  def initialize
    @lyrics = File.new('song.txt')
  end

  def verse(num)


    # find the beginning of a line that starts with number
  end
end

song = BeerSong.new

p song.lyrics.scan
