require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)["results"]

  films_urls = []
  character_hash.each do |character_info|
      if character_info["name"] == character
        films_urls = character_info["films"]
      end
  end

  get_films(films_urls)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def get_films(films_urls)
  films_urls.map do |film_url|
    films_data = RestClient.get(film_url)
    films_parse = JSON.parse(films_data)
  end
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts film["title"]
    # binding.pry
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?



#getter = attr_reader(color=) & setter = attr_writer (color)
