//////////////////////////////////////////////////////////
//COMPLETE MACRO
/////////////////////////////////////////////////////////

////////////////////////////
//Set up directories
///////////////////////////

// Asks for the directory with the Raw MDA data in it and the .md files (the date ex '091514')
direxperiment = getDirectory("Choose the Experiment Directory ");
//print("experiment directory: " + direxperiment);


// Gets the parent path for the directory with the Raw-MDA data
pathmda = File.getParent(direxperiment) + '/raw-mda'
// pathmda = direxperiment + 'raw-mda/'
//print("pathmda: " + pathmda);

// renames the Main directory to raw-mda
File.rename(direxperiment,pathmda);

// makes a directory with the original experiment directory name (the date)
File.makeDirectory(direxperiment);

// moves the raw-mda directory into the experiment directory (the date) 
File.rename(pathmda,direxperiment+'raw-mda');

//////////////////////////////////////////////////////
//Stack builder
//////////////////////////////////////////////////////

// Makes directory for the stacks to go
File.makeDirectory(direxperiment+'collected-stacks');

/////Define paths  for .nd files - optional may change to user input by leaving select blank in stack builder
pathmda = direxperiment+'raw-mda/'
//print("pathmda:" + pathmda);

pathss = pathmda +'sscal.nd'
//print("pathss:" + pathss);

pathwetamb = pathmda +'wet-amb.nd'
//print("pathwetamb:" + pathwetamb);

pathstacks = direxperiment+'collected-stacks'+'/'
print("pathstacks:" + pathstacks);

// Makes stacks in the stacks folder. You can either enter a path in the the select=, or leave it blank to prompt the user to select the nd files.
// **The macro will quit if the prompt for the nd file is canceled.**
run("Metamorph nd file (stack builder)", "select= first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]"); //pathss
run("Metamorph nd file (stack builder)", "select= first=1 last=10 6=well1 all_timepoints all_positions open=[pathstacks]"); //pathwetamb


/////////////////////////////////////////////////////////////
//Concatenate stacks from each position, make image sequences and measure results
/////////////////////////////////////////////////////////////

// Make directory for concatenated stacks
File.makeDirectory(direxperiment+'concatenated-stacks');
pathcat = direxperiment+'concatenated-stacks'+'/'

// Make directory for image sequences
File.makeDirectory(direxperiment+'image-sequences');
pathseq = direxperiment+'image-sequences'+'/'

//Make directory for intensity results
File.makeDirectory(direxperiment+'intensity-measurements');
pathresults = direxperiment+'intensity-measurements'+'/'

list = getFileList(pathstacks);
for (j=1; j<list.length; j++) {           // where the no images to open at the end comes from, aske user to specifiy number of positions?
	wellnumber = toString(j+".tif");
	for (i=0; i<list.length; i++){
		if (endsWith(list[i],wellnumber)) {
			print(j+","+list[i]);
			open(pathstacks+list[i]);
		}
	}
	run("Concatenate...", "all_open title=temp-stack");
	saveAs("Tiff", pathcat+"well"+wellnumber);
	File.makeDirectory(pathseq+"well"+j);
	pathsaveseq = pathseq+"well"+j+"/";
	run("Image Sequence... ", "format=TIFF name=sequence start=0 digits=4 save=pathsaveseq");
	input =pathsaveseq;
	listseq= getFileList(pathsaveseq);
	for (k = 0; k < listseq.length; k++) {
		action(input, listseq[k]);
		function action(input, filename) {
			open(input + filename);
			//makeRectangle(473, 155, 106, 110);
			run("Measure");
			close();
		}
	}
	saveAs("Results", pathresults+"well"+j+".csv");
	run("Clear Results");
	run("Close All");
}
///////////////////////////////////////////////////////////
