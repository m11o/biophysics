require_relative 'human'
require_relative 'dice'

require 'csv'

module Maxwell
  class Group
    attr_accessor :humans

    def self.build(number = 6, all_coins_count = 30)
      group = Group.new(number, all_coins_count)
      group.init_humans group.shuffle_init_coins
      group
    end

    def shuffle_init_coins
      coins = fill_zero_coins

      @all_coins_count.times do
        number = @dice.shake
        coins[number] += 1
      end
      coins
    end

    def fill_zero_coins
      coins = Array.new(@number)
      coins.fill(0, 0..(@number - 1))
      coins
    end

    def <<(human)
      @humans << human
    end

    def init_humans(coins)
      @humans = coins.map do |coin_count|
        Human.new coin_count
      end
    end

    def trial
      out_index = @dice.shake
      in_index = @dice.shake

      spending_human = @humans[out_index]
      revenue_human = @humans[in_index]
      other_humans = unselect_humans(out_index, in_index)
      other_humans.each(&:keep_coin)

      if spending_human.zero? || out_index == in_index
        spending_human.keep_coin
        revenue_human.keep_coin if out_index != in_index
      else
        spending_human.decrement_coin
        revenue_human.increment_coin
      end

      current_top_human!
    end

    def build_csv
      CSV.generate do |csv|
        header = (0..(@number - 1)).map { |index| human_name(index) }
        csv << header

        @humans.map { |human| human.record.records }.transpose.each do |result|
          csv << result
        end
        top_counts, zero_counts = @humans.map { |human| [human.record.top_count, human.record.zero_count] }.transpose
        csv << %w[TOP]
        csv << top_counts
        csv << %w[ZERO]
        csv << zero_counts
      end
    end

    def current_top_human!
      current_coins = @humans.map(&:current_coin)
      max_coin = current_coins.max

      @humans.each do |human|
        next if human.current_coin != max_coin

        human.top!
      end
    end

    private

    def initialize(number, all_coins_count)
      @number = number
      @all_coins_count = all_coins_count
      @humans = []
      @dice = Dice.new(@number)
    end

    def unselect_humans(out_index, in_index)
      @humans.select.with_index { |_, index| ![out_index, in_index].include?(index) }
    end

    def human_name(index)
      alphabets = ('A'..'Z').to_a
      alphabets[index]
    end
  end
end
