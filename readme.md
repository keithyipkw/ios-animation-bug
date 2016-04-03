Sometimes when table view cells appear in animations, the contents inside them pop from top left (0, 0) to the final sizes. 
To reliably reproduce the problem, set a breakpoint at viewWillAppear, before reloadData. Pull down the screen to show the today center. Run after the today center fully visible.</br>
![alt tag](https://raw.githubusercontent.com/keithyipkw/ios-animation-bug/master/screenshots.png)
