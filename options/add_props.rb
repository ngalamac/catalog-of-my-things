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
end
