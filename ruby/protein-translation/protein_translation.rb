# Write your code for the 'Protein Translation' exercise in this file. Make the tests in
# `protein_translation_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/protein-translation` directory.

module Translation
  DICTIONARY = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  private_constant :DICTIONARY

  def self.of_rna(strand)
    strand.each_char.each_slice(3).each_with_object([]) do |codon, result|
      codon = codon.join

      protein = DICTIONARY.fetch(codon, nil)

      raise InvalidCodonError, "Invalid codon: #{codon}" if protein.nil?
      return result if protein == 'STOP'

      result << protein
    end
  end
end

class InvalidCodonError < StandardError; end
