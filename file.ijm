// print("user selected: " + getDirectory("Select a Directory"));
direxperiment = getDirectory("Choose the Experiment Directory ");
print("experiment directory: " + direxperiment);
path = direxperiment+'sscal.nd'
// run("Metamorph nd file (stack builder)", "select=&path first=1 last=10 6=well1 all_timepoints all_positions open=[/Users/martinbrennan/Desktop/test-data/---Destination Folder---]");

// run("Metamorph nd file (stack builder)", "select=/Volumes/Untitled/imageJ-test/exp.nd first=1 last=10 6=well1 all_timepoints all_positions open=[path---Destination Folder---]");
// run("Metamorph nd file (stack builder)", "select=/Volumes/Untitled/imageJ-test/wet-amb.nd first=1 last=10 6=well1 all_timepoints all_positions open=[/Volumes/Untitled/imageJ-test/---Destination Folder---]");
// experiment directory: /Users/martinbrennan/Desktop/test-data/

// print(getFileList(direxperiment);

count = 1;
listFiles(direxperiment); 


function listFiles(direxperiment) {
     list = getFileList(direxperiment);
     for (i=0; i<list.length; i++) {
        if (endsWith(list[i], "/"))
           listFiles(""+direxperiment+list[i]);
        else
           print((count++) + ": " + direxperiment + list[i]);
     }
  }
