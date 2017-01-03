#!/usr/bin/ruby -w
require './rover'
#parsefile
def parsefile(filename)
  f = File.new(filename,"r")
  counter = 0

  while(line = f.gets)
    if counter == 0 #We interpret grid size
      grid = line.split(' ')
      if grid.length < 2 and grid.length > 2
        puts "Invalid amount of inputs for the grid size"
      end
    end
    if counter == 1 #We interpret starting position
      position = line.split(' ')

      if position.length < 3 and position.length > 3
        puts "Invalid amount of inputs for the starting position"
      end
    end
    if counter == 2 #We interpret the movements
      movements = line.split('')
      if movements.length < 1
        puts "Invalid amount of inputs for movements"
      end
    end
    if counter == 3 #We interpret our expected output for our unit tests
      testoutput = line
    end
    counter+=1
  end
  f.close
  #lets create our rover object and return it

  r = Rover.new(position.at(0),position.at(1),position.at(2), grid.at(0),grid.at(1))
  r.setExpectedoutput(testoutput)
  r.setMovements(movements)
  return r
end

#Handle some command line arguements
if ARGV.at(0) == 'test'
  #Lets run some tests to see how accurate we are
  testcounter = 1
  puts 'Starting tests'
  files = Dir["tests/*.txt"]
  files.each do |filename|
    if !File.directory? filename
      puts 'Running test case #' + testcounter.to_s
      rover = parsefile(filename)
      rover.makeMoves
      output = rover.getOutput
      if output == rover.getExpectedoutput
        puts 'Test case #' + testcounter.to_s + ' has passed'
      else
        puts 'Test case #' + testcounter.to_s + ' has failed'
        puts 'Expected output = '+rover.getExpectedoutput+ ' Actual output = '+rover.getOutput
      end
    end
    testcounter+=1
  end
else
  filename = ARGV.at(0)

  rover = parsefile(filename)

  rover.makeMoves
  output = rover.getOutput
  puts output
end
