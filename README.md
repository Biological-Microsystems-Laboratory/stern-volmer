stern-volmer
============

Steps:

1. Run the stack builder macro (stack-builder.txt) selecting the calibration and expiriment nd files.
* may have to change *.TIF to *tif 
	$ for old in *.TIF; do mv $old `basename $old .TIF`.tif; done


2. Rename all well1 to well01, well2 to well02 etc.

3. copy into exp and ss folders

4. Run measure macro (measure.txt)

5. save Results.xls, open it and delete the header, save as Results.csv

6. run stern volmer analysis. (may have to adjust where the calibration averages are taken from)





Stern-Volmer Analysis 

imagej for intensity measurment

when given the directory 

build stacks from .nd files
run image sequence for each in its own directory
do the measurments
save the results

[nd-stack-builder](http://imagejdocu.tudor.lu/doku.php?id=plugin:inputoutput:nd_stacks_builder:start) must be installed for the imageJ macro to work

todo
----

add prompt for user to draw a region of interest
	http://imagejdocu.tudor.lu/doku.php?id=plugin:utilities:wait_for_user:start



