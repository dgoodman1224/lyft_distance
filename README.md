lyft_distance
=============
## Description:
###When given 4 coordinates, finds shortest logical route.  

####Operates under the following assumptions:
* 1- Coordinates are given in a two-element array such as [1,7]
* 2- All four coordinates are given as four separate elements
* 3- Each coordinate is assumed to be given in order of driver A starting point, driver B starting point, driver A drop-off point, driver B drop-off point
* 4- Coordinates represent miles, so to drive from [1,5] to [1,10] is a 5.0 mile drive.

##Directions:

To use, call main function #find_shortest_distance while passing four coordinates as parameters.
Returns a string describing the trip, and the total distance of optimal trip

#### Example: 

#####Call:

find_shortest_distance([1,5],[1,10],[1,15],[1,20])

#####Return:
"First you would pickup Driver A at his starting point, then you would pickup Driver B at her starting point, then you would drop-off Driver A at his destination, and finally drop-off Driver B at her destination.  The total distance would be 15.0 miles"
