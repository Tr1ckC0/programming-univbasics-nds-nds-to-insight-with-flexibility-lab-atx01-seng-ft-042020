# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
  a_o_h = []
  i = 0

  while i < movies_collection.length do 
    a_o_h << movie_with_director_name(name, movies_collection[i])
    i += 1
  end
  a_o_h
end

def gross_per_studio(collection)
  studio_totals = {}
  
  i = 0
  while i < collection.length do 
    studio_name = collection[i][:studio]
    studio_gross = collection[i][:worldwide_gross]
    
    if !studio_totals[studio_name]
      studio_totals[studio_name] = studio_gross
    else
      studio_totals[studio_name] += studio_gross
    end
    
    i += 1
  end
  
  studio_totals
end

def movies_with_directors_set(source)
  #for each movie by each director add the :title and :director_name

  array_of_movies_by_director = []
  out_i = 0
  while out_i < source.length do
    director = source[out_i][:name]
    in_i = 0

    while in_i < source[out_i][:movies].length do
      source[out_i][:movies][in_i][:director_name] = director
      new_array = []
      new_array << source[out_i][:movies][in_i]
    
      array_of_movies_by_director << new_array
    
      in_i += 1
    end

    out_i +=1
  end

  array_of_movies_by_director
end

# def movies_with_directors_set(source)
# #   # GOAL: For each director, find their :movies Array and stick it in a new Array
  
# #   # INPUT:
# #   # * source: An Array of Hashes containing director information including
# #   # :name and :movies
  
# #   # RETURN:
  
# #   # Array of Arrays containing all of a director's movies. Each movie will need
# #   # to have a :director_name key added to it.

# #   # expect restult .to_eq [[{:title => "test", :director_name => "By Poodle"}], [{}]]

#   movies_by_each_director = []

#   outter_i = 0
#   while source[outter_i] do 
#     # directors_movies = []
#     # director = source[outter_i][:name]
#     movies_array = source[outter_i][:movies]
#     director = source[outter_i][:name]
#     # movies_by_each_director << movie_with_director_name(director, source[outter_i][:movies])

#     inner_i = 0
#     while movies_array[inner_i] do

#       movies_by_each_director << movie_with_director_name(director, source[outter_i][:movies][inner_i])
#       # new_hash = {}
#       # new_hash[:title] = movies_array[inner_i][:title]
#       # new_hash[:director_name] = director
#       # directors_movies << new_hash
      
#       inner_i += 1
#     end
  
#     # movies_by_each_director << directors_movies
#     outter_i += 1
#   end
  
#   movies_by_each_director
# end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end