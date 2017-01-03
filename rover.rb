class Rover
  def initialize(x,y,direction,gridsizex,gridsizey)
    #Best we express direction in some type of radian form on the cartesian plane
    #0 east 1 south 2 west and 3 north
    #We also allowing our rover to self test on test cases
    #We have been provided with inputs for grid sizes but there doesn't seem to be mention
    #on what this actually impacts in this code, so this has been left blank for the time being
    
    if direction == "E"
      orientation = 0
    end
    if direction == "S"
      orientation = 1
    end
    if direction == "W"
      orientation = 2
    end
    if direction == "N"
      orientation = 3
    end

    @x,@y,@direction,@gridsizex,@gridsizey = x.to_i,y.to_i,orientation,gridsizex,gridsizey
  end
  def rotate(stringdirection)
     #We will use the string passed direction to change our direction
    if stringdirection == "R"
      @direction+=1
    end

    if stringdirection == "L"
      @direction-=1
    end

    if @direction == -1 #Full 360
      @direction = 3
    end
    if @direction == 4 #Full 360
      @direction = 0
    end

  end
  def move(charmovement)

    if charmovement == 'M'
      if @direction == 0
        @x+=1
      end
      if @direction == 1
        @y-=1
      end
      if @direction == 2
        @x-=1
      end
      if @direction == 3
        @y+=1
      end
    else
      rotate(charmovement) #If we not moving in a particular direction lets just rotate
    end
  end
  def getX
    @x
  end
  def getY
    @y
  end
  def getOrientation
    @direction
  end

  def toDirection(num)
    map = ['E','S','W','N']
    map.at(num)
  end
  def setMovements(movements)
    @movements = movements
  end
  def makeMoves
    @movements.each do |movement|

      move(movement)
    end
  end
  def setExpectedoutput(output)
    @expectedoutput = output.strip
  end
  def getExpectedoutput
    @expectedoutput.strip
  end
  def getOutput
    return (getX.to_s + ' ' + getY.to_s + ' ' + toDirection(@direction)).strip
  end
end
