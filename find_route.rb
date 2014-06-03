def find_shortest_distance(a, b, c, d, lengths_hash = {})
	#creates a hash with trip title description and total distance
	#each trip#number coincides with a possible way to manage the trip. ie a passanger cannot be dropped off before they are picked up
	possible_routes = [[a,b,c,d], [a,b,d,c], [a,c,d,b], [b,a,c,d], [b,a,d,c], [b,d,a,c]]
	possible_routes.each { |route| lengths_hash["trip#{possible_routes.index(route)+1}"] = distance_three_stops(route)}
	max = lengths_hash.sort_by{|k,v| v}.first
	#formats hash element to be used for return string
	format_response(max)
end

def distance_three_stops(coords)
	#finds distance between each of the 4 stops and adds them together
	distance(coords[0], coords[1]) + distance(coords[1], coords[2]) + distance(coords[2], coords[3])
end

def distance(coord1, coord2)
	Math.sqrt((coord2[0]-coord1[0])**2 + (coord2[1]-coord1[1])**2).round(2)
end

def format_response(trip_and_distance)
	distance = trip_and_distance.last
	#This hash gives the order for whichever trip is deemed optimal
	trip_order = {"trip1"=>["a", "b", "c", "d"], "trip2"=>["a", "b", "d", "c"], "trip3"=>["a", "c", "d", "b"], "trip4"=>["b", "a", "c", "d"], "trip5"=>["b", "a", "d", "c"], "trip6"=>["b", "d", "a", "c"]}
	return_string(trip_order[trip_and_distance[0]], distance)
end

def return_string(trip_order, distance)
	#Defines waht each point entails to return string showing order
	responses = {'a' => 'pickup Driver A at his starting point' , 'b' => 'pickup Driver B at her starting point', 'c' => 'dropoff Driver A at his destination' , 'd' => 'dropoff Driver B at her destination'}

	"First you would #{responses[trip_order[0]]}, then you would #{responses[trip_order[1]]}, then you would #{responses[trip_order[2]]}, and finally #{responses[trip_order[3]]}.  The total distance would be #{distance} miles"
end
