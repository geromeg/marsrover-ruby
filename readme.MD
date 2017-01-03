#Run Instructions

##Linux

1. Open a terminal window
2. CD into the code directory
3. We have two modes which we can run in
  * Test mode
    * Run command : ruby program.rb test
  * Live mode
    * Run command : ruby program.rb {filename}
    * Example : ruby program.rb tests/testcase2.txt

##Windows

1. Open a cmd.exe window
2. CD into the code directory
3. We have two modes which we can run in
  * Test mode
    * Run command : ruby program.rb test
  * Live mode
    * Run command : ruby program.rb {filename}
    * Example : ruby program.rb tests\testcase2.txt

#Adding more test cases

To add test cases simply create files with the .txt file extension in the tests folder. With the following format:

8 8
1 1 E
MMLMRMMRRMML
3 3 S

Line 1: Grid size x and y
Line 2: Initial position and direction , x,y and direction (E,S,N,W)
Line 3: Movements (M = Move , L = Turn left 90 deg, R = Turn right 90 deg)
Line 4: Expected output x,y and direction 
