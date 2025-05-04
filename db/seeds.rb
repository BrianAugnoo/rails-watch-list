require 'uri'
require 'net/http'
require 'json'

puts "seed aborted"


url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNGE1ZjBlNThhNTY2YmMzNmQ1YTYxN2QxYWNkYzY5MSIsIm5iZiI6MTc0NjI2OTg5MS4zODcsInN1YiI6IjY4MTVmNmMzNDQxMTZhYjdiYzkxMmYyMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vyZG_33q9lz1XgPc-c-vKcxTdDV20DrvdszZvrqJ_zc'

response = http.request(request)

lists = JSON.parse(response.read_body)
lists["results"].each do |result|
  Movie.create!(
    add_title: result["original_title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{result["poster_path"]}",
    rating: result["vote_average"].to_i
  )
end

puts "seed succesfull"
