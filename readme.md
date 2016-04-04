Sometimes when table view cells appear in animations, the contents inside them pop from top left (0, 0) to the final sizes. 
To see the problem, checkout 90d64db4f947e23175185731d9e8f2b1bb739652. Enable the slow animation in the simulator. Run the today widget. Pull down the screen to show the today center. Each pull down will toggle the the number of rows</br></br>
The fix is to use dequeue and init cells with reuse identifiers. It still works when a cell appear the first time.</br>
```
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.textColor = [UIColor whiteColor];
}
```
![alt tag](https://raw.githubusercontent.com/keithyipkw/ios-animation-bug/master/screenshots.png)
