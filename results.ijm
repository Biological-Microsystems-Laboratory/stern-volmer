input ="/Users/martinbrennan/Pictures/";
list= getFileList(input);
for (i = 0; i < list.length; i++)
action(input, list[i]);
function action(input, filename) {
open(input + filename);
// makeRectangle(247, 102, 174, 152);
run("Measure");
close();
}
 
// saves the 'Results' window to the path and file name below
saveAs("Results", "/Users/martinbrennan/Documents/stern-volmer/results.csv");

// closes the 'Results' window
run("Close")
