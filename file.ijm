// print("user selected: " + getDirectory("Select a Directory"));

// Asks for the directory with the Raw-MDA data in it (the date ex '091514')
direxperiment = getDirectory("Choose the Experiment Directory ");
print("experiment directory: " + direxperiment);


// Gets the parent path for the directory with the Raw-MDA data
pathmda = File.getParent(direxperiment) + '/raw-mda'
// pathmda = direxperiment + 'raw-mda/'
print("pathmda: " + pathmda);

// renames the Main directory to raw-mda
File.rename(direxperiment,pathmda);

// makes a directory with the original experiment directory name (the date)
File.makeDirectory(direxperiment);


print("this:"+ direxperiment+'raw-mda' );
// moves the raw-mda directory into the experiment directory (the date) 
File.rename(pathmda,direxperiment+'raw-mda');

// make directories for stacks and results data
File.makeDirectory(direxperiment+'stacks');
File.makeDirectory(direxperiment+'intensity-measurments');

pathmda = direxperiment+'raw-mda/'
print("pathmda:" + pathmda);

pathss = pathmda +'sscal.nd'
print("pathss:" + pathss);
pathwetamb = pathmda +'wet-amb.nd'

pathstacks = direxperiment+'stacks'+'/'
print("pathstacks:" + pathstacks);

// Makes stacks in the stacks folder
run("Metamorph nd file (stack builder)", "select=pathss first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]");
run("Metamorph nd file (stack builder)", "select=pathwetamb first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]");



////////////////////////////////////////////////////////////
// code copied that lists file names
// print(getFileList(direxperiment);

// count = 1;
// listFiles(direxperiment); 


// function listFiles(direxperiment) {
//     list = getFileList(direxperiment);
//     for (i=0; i<list.length; i++) {
//        if (endsWith(list[i], "/"))
//           listFiles(""+direxperiment+list[i]);
//        else
//           print((count++) + ": " + direxperiment + list[i]);
//     }
//  }
//////////////////////////////////////////////////////////
