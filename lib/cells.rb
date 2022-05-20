class Cell

  attr_reader :shot, :coordinate, :coordinate_hash, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @shot = false
    @ship = ()

  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship == ()
  end

  def fired_upon?
    if @shot == false
      false
    else
      true
    end
  end

  def fire_upon
      @shot = true
      if empty? == false
        @ship.hit
      end
  end

  def render(bool = nil)
    @render_bool = bool
    if fired_upon? == true && empty? == false && ship.sunk? == true
      return "X"
    elsif @render_bool == true  && empty? == false
      return "S"
    elsif fired_upon? == true && empty? == false
      return "H"
    elsif fired_upon? == true && empty? == true
      return "M"
    else
      return "."
    end
  end
end
