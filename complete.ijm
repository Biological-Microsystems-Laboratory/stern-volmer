//////////////////////////////////////////////////////////
//COMPLETE MACRO
/////////////////////////////////////////////////////////

////////////////////////////
//file.ijm - organizes the directories
///////////////////////////
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

//////////////////////////////////////////////////////
//Stack builder
//////////////////////////////////////////////////////


File.makeDirectory(direxperiment+'collected-stacks');

/////Define paths  for .nd files - maybe change to user input
pathmda = direxperiment+'raw-mda/'
//print("pathmda:" + pathmda);

pathss = pathmda +'sscal.nd'
//print("pathss:" + pathss);

pathwetamb = pathmda +'wet-amb.nd'
//print("pathwetamb:" + pathwetamb);

pathstacks = direxperiment+'collected-stacks'+'/'
print("pathstacks:" + pathstacks);

// Makes stacks in the stacks folder
run("Metamorph nd file (stack builder)", "select=pathss first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]");
run("Metamorph nd file (stack builder)", "select=pathwetamb first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]");

/////////////////////////////////////////////////////////////
//Concatenate stacks from each position according to the ending position number
/////////////////////////////////////////////////////////////

// Make directory for concatenated stacks
File.makeDirectory(direxperiment+'concatenated-stacks');
pathcat = direxperiment+'concatenated-stacks'+'/'

list = getFileList(pathstacks);
for (j=1; j<list.length; j++) {
	wellnumber = toString(j+".tif");
	for (i=0; i<list.length; i++){
		if (endsWith(list[i],wellnumber)) {
			print(j+","+list[i]);
			open(pathstacks+list[i]);
		}
	}
	run("Concatenate...", "all_open title=temp-stack");
	saveAs("Tiff", pathcat+"well"+wellnumber);
	run("Close All");
}
///////////////////////////////////////////////////////////
