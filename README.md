lyft_distance
=============

When given 4 coordinates, finds shortest logical route.  Opperates under a few assumptions:

1- Coordinates are given in a two-element array such as [1,7]
2- All 4 cooridinates are given as four separate elements
3- Each coordinate is assumed to be given in order of driver A starting point, driver B starting point, driver A dropoff point, driver B dropoff point
4- Coordiantes represent miles, so to drive from [1,5] to [1,10] is a 5.0 mile drive.


To use, use main function #find_shortest_distance
Returns a string describing the trip and the total distance of optimal trip

Example:  p find_shortest_distance([1,5],[1,10],[1,15],[1,20])

"First you would pickup Driver A at his starting point, then you would pickup Driver B at her starting point, then you would dropoff Driver A at his destination, and finally dropoff Driver B at her destination.  The total distance would be 15.0 miles"



