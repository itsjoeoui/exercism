# Write your code for the 'Twelve Days' exercise in this file. Make the tests in
# `twelve_days_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/twelve-days` directory.

module TwelveDays
  def self.song
    file = File.expand_path('song.txt', __dir__)
    IO.read(file)
  end
end
