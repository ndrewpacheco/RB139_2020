class Sieve
  def initialize(limit)
    @limit = limit
    @range = Hash[(2..limit).map { |num| [num, :unmarked] }]
  end

  def primes
    @range.keys.each_cons(1) do |key|
      key = key[0]
      @range.each do |num, marker|
        next if marker == :marked || key == num
        @range[num] = :marked if num % key == 0
      end
    end
    @range.keys.select { |key| @range[key] == :unmarked }
  end
end
