# Write your code for the 'Beer Song' exercise in this file. Make the tests in
# `beer_song_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/beer-song` directory.

class BeerSong
  def self.recite(start, take)
    BeerSong.new(start, take).recite
  end

  def initialize(start, take)
    @start = start
    @take = take
  end

  def recite
    @take.times.map do |n|
      verse(@start - n)
    end.join("\n")
  end

  private

  def verse(n)
    if n.zero?
      NO_MORE
    else
      "#{bottle(n).capitalize} of beer on the wall, #{bottle(n)} of beer.\n" \
        "Take #{one(n)} down and pass it around, #{bottle(n - 1)} of beer on the wall.\n"
    end
  end

  NO_MORE = <<~SONG
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
  SONG

  def bottle(n)
    return 'no more bottles' if n.zero?
    return '1 bottle' if n == 1

    "#{n} bottles"
  end

  def one(n)
    n == 1 ? 'it' : 'one'
  end
end
