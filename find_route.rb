def find_shortest_distance(a, b, c, d, lengths_hash = {})
#creates a hash with trip number key, and value of total distance of said trip, then passes shortest trip
	#these are the possible trip routes, as a passenger cannot be dropped off before they are picked up
	possible_routes = [[a,b,c,d], [a,b,d,c], [a,c,d,b], [b,a,c,d], [b,a,d,c], [b,d,a,c]]
	possible_routes.each { |route| lengths_hash["trip#{possible_routes.index(route)+1}"] = distance_three_stops(route)}
	shortest_trip = lengths_hash.sort_by{|k,v| v}.first
	#formats hash element to be used for return statement
	format_response(shortest_trip)
end

def distance_three_stops(coords)
#finds distance for each leg of trip and returns sum
	distance(coords[0], coords[1]) + distance(coords[1], coords[2]) + distance(coords[2], coords[3])
end

def distance(coord1, coord2)
#finds distance between two points
	Math.sqrt((coord2[0]-coord1[0])**2 + (coord2[1]-coord1[1])**2).round(2)
end

def format_response(trip_and_distance)
#parses parameter to return order of trip and total distance
	distance = trip_and_distance.last
	#This hash gives the order for whichever trip is deemed optimal
	trip_order = {"trip1"=>["a", "b", "c", "d"], "trip2"=>["a", "b", "d", "c"], "trip3"=>["a", "c", "d", "b"], "trip4"=>["b", "a", "c", "d"], "trip5"=>["b", "a", "d", "c"], "trip6"=>["b", "d", "a", "c"]}
	return_string(trip_order[trip_and_distance[0]], distance)
end

def return_string(trip_order, distance)
#creates return string to describe trip and give total distance
	#this hash defines what each point entails to return string showing order
	responses = {'a' => 'pickup Driver A at his starting point' , 'b' => 'pickup Driver B at her starting point', 'c' => 'dropoff Driver A at his destination' , 'd' => 'dropoff Driver B at her destination'}
	"First you would #{responses[trip_order[0]]}, then you would #{responses[trip_order[1]]}, then you would #{responses[trip_order[2]]}, and finally #{responses[trip_order[3]]}.  The total distance would be #{distance} miles"
end

