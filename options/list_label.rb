module ListLabels
  def list_labels
    puts "\nLABELS LIST:\n"
    if @labels.empty?
      puts 'No labels found'
    else
      @labels.each_with_index do |label, i|
        puts "#{i + 1}) Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
