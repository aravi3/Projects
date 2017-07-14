puts "Input your email: "
email = gets.chomp
  #user = User.find(email: email)
puts "What do you want to do?"
puts "0. Create shortened URL"
puts "1. Visit shortened URL"
option = gets.chomp.to_i
if option == 0
  puts "Type in your long url"
  long_url = gets.chomp
  puts "Short url is: #{ShortenedUrl.random_code}"
  puts "Goodbye!"
else
  puts "Type in the shortened URL"
  short_url = gets.chomp
  puts "Launching http://www.appacademy.io"
  puts "Goodbye!"
  Launchy.open("http://www.appacademy.io")
end
