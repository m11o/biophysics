require 'singleton'

module Maxwell
  class Dice
    include Singleton

    ROLL_OF_THE_DICE = (0..5).to_a.freeze

    def shake
      ROLL_OF_THE_DICE.sample
    end
  end
end
