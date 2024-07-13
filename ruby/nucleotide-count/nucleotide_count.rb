# Write your code for the 'Nucleotide Count' exercise in this file. Make the tests in
# `nucleotide_count_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/nucleotide-count` directory.

class Nucleotide
  attr_reader :histogram

  NUCLEOTIDES = 'ACTG'.freeze

  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    raise ArgumentError unless dna.match?(/^[#{NUCLEOTIDES}]*$/)

    @histogram = dna.chars.tally

    NUCLEOTIDES.chars.each do |nucleotide|
      histogram[nucleotide] = 0 if histogram[nucleotide].nil?
    end
  end

  def count(letter)
    histogram[letter]
  end
end
