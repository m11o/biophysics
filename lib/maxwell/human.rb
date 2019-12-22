require_relative 'dice_record'

module Maxwell
  class Human
    attr_accessor :record

    def initialize(coin_count)
      @record = DiceRecord.new(self, coin_count)
    end

    def add_record(number)
      @record << number
      @record.zero_count += 1 if number.zero?
    end

    def current_coin
      @record.last
    end

    def zero?
      current_coin.zero?
    end

    def increment_coin
      add_record(current_coin + 1)
    end

    def decrement_coin
      add_record(current_coin - 1)
    end

    def top!
      @record.top_count += 1
    end

    def keep_coin
      add_record current_coin
    end
  end
end
