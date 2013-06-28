Copyright (c) 2012 Newark, Premier Farnell DBA Cadsoft Computer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Jorge Garcia
03-Mar-2012

--- How to use ---

1. Copy the included .ulp to your eagle folder which depending on your OS could be under My Documents, your Home Folder, or
Documents (Win, Lin, Mac respectively).
2. Open up the board file you wish to import the DXF into.
3. Click on the ULP icon or type in the word RUN followed by enter in the command line.
4. Browse to the ULP and click OK.
5. The ULP's dialog will now pop up.
6. Click on browse to find the DXF file you wish to import and click OK. Set the units, origins, and linewidth, then click OK.
7. The ULP will now show you the generated script in case you want the DXF to be imported on a particular layer you can change it
here.
8. Click Run and voila your DXF file will be imported into EAGLE.

--- Troubleshooting ---

-EAGLE displays an error that says "Coordinates (x y) are out of range! Maximum allowed range is +/-78740.15748 mil"
 + EAGLE currently supports a maximum work area of 150" by 150" so if your DXF file is larger than this EAGLE will produce
 the error. Scale the drawing in your mechanical CAD program and then import it.
 + EAGLE starts drawing from the origin to the right and up so if your drawing is less than 150" by 150" but longer than 78.75
 inches, then you might still get an error. In this case add a negative offset that way the import will begin to the left and down
 from the absolute origin, this will allow the DXF to take up the entirety of the drawing area.

-The ULP returns an empty script with lines=1 or 0 and circles, polylines, and arcs equal to zero.
 + This means that the DXF file contains elements that the ULP can't process. The only thing to do here is to open the DXF file
 in a mechanical CAD format and try to export it exploded, or with some other DXF variant.  
