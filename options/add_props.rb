require './classes/genre'
require './classes/label'
require './classes/author'

module AddProps
  def choose_author(item)
    puts "Enter author's first name:"
    first_name = gets.chomp.to_s
    puts "Enter author's second name:"
    last_name = gets.chomp.to_s
    author = @authors.find { |a| a.first_name == first_name && a.last_name == last_name } ||
             Author.new(first_name, last_name)
    @authors << author unless @authors.include?(author)
    item.author = author
  end

  def choose_label(item)
    puts 'Label title:'
    title = gets.chomp.to_s
    puts 'Label color:'
    color = gets.chomp.to_s
    label = @labels.find { |l| l.title == title } || Label.new(title, color)
    @labels << label unless @labels.include?(label)
    item.label = label
  end

  def choose_genre(item)
    puts 'Enter genre:'
    genre_name = gets.chomp
    genre = @genres.find { |g| g.name == genre_name } || Genre.new(genre_name)
    @genres << genre unless @genres.include?(genre)
    item.genre = genre
  end
end
