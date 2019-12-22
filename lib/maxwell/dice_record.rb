module Maxwell
  class DiceRecord
    attr_accessor :records, :top_count, :zero_count

    def initialize(human, init_coin_count)
      @human = human
      @records = [init_coin_count]
      @zero_count = init_coin_count.zero? ? 1 : 0
      @top_count = 0
    end

    def <<(count)
      records << count
    end

    def increment_top_count
      @top_count += 1
    end

    def increment_zero_count
      @zero_count += 1
    end

    def last
      @records.last
    end
  end
end
