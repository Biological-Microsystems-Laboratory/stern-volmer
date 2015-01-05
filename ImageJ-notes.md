ImageJ notes
===

endsWith(string, suffix)
Returns true (1) if string ends with suffix. See also: startsWith, indexOf, substring, matches. **accepts strings only use toString(number)  to convert numbers to strings**

case of extenstion for tif file can be changed with this command:

	$ find . -iname "*.TIF.tif.tif" -exec bash -c 'mv "$0" "${0%\.TIF.tif.tif}.tif"' {} \;

