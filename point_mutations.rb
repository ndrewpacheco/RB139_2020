# DNA
class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    max_count = [strand.size, distance.size].min
    counter = 0
    result =  0

    while counter < max_count
      result += 1 unless strand[counter] == distance[counter]
      counter += 1
    end
    result
  end
end
