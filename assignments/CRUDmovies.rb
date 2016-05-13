movies={zootopia:4,
beauty:5}
puts "What would you like to do? please enter 'add' 'update' 'delete' 'display'."
choice=gets.chomp
choice.downcase!

case choice

when "add"
puts "input a movie name:"
title=gets.chomp
title.downcase!

if movies[title.to_sym].nil?
    puts "what is your mark?"
    rating=gets.chomp
    rating.downcase!
    movies[title.to_sym]=rating.to_i
else
    puts "movies are already exist"
end


when "update"
puts "input a movie name:"
title=gets.chomp
title.downcase!

if movies[title.to_sym].nil?
    puts"Movie does not exit"
else
    
    puts "what is your mark?"
    rating=gets.chomp
    rating.downcase!
    movies[title.to_sym]=rating.to_i
end

when "display"
movies.each {|movie,rating|
puts "#{movie}: #{rating}"
}

when "delete"
puts"which movie u want to delete?"
title=gets.chomp
title.downcase!
if movies[title.to_sym].nil?
    puts"movie does not exist"
else 
    movies.delte[title.to_sym]
end


else 
puts "Error!"

end
