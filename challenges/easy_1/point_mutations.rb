# DNA
class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    counter = 0
    strands = [@strand, distance].sort_by(&:length)

    strands[0].chars.each_with_index do |char, idx|
      counter += 1 unless char == strands[1].chars[idx]
    end
    counter
  end
end
