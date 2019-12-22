module Maxwell
  class Dice
    def initialize(surface_count)
      @surface_count = surface_count
    end

    def shake
      (0..(@surface_count - 1)).to_a.sample
    end
  end
end
