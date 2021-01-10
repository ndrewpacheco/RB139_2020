class InvalidCodonError < StandardError
end

# protein_translation.rb
class Translation
  AMINO_ACIDS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA)
  }.freeze

  def self.of_codon(codon)
    AMINO_ACIDS.select do |amino, codons|
      return amino if codons.any?(codon)
    end
  end

  def self.of_rna(strand)
    aminos = []
    (strand.size / 3).times do
      codon = of_codon(strand.slice!(0, 3))
      break if codon == 'STOP'
      raise InvalidCodonError unless AMINO_ACIDS.keys.include?(codon)
      aminos << codon
    end
    aminos
  end
end
