class View
  def show(records)
    puts "Websites:"
    records.each_with_index do |record, index|
      puts "#{index + 1}. #{record.path}"
    end
  end

  def display_most_viewed(records)
    puts "Most visited websites:"
    records.each_with_index do |record, index|
      puts "#{index + 1}. #{record.path}: #{record.ip.length} total views"
    end
  end

  def display_most_unique(records)
    puts "Websites with the most unique views:"
    records.each_with_index do |record, index|
      puts "#{index + 1}. #{record.path}: #{record.unique} unique users"
    end
  end

  def display_how_many_users(records)
    puts "Websites with the most users:"
    records.each_with_index do |record, index|
      puts "#{index + 1}. #{record.path}: #{record.ip.uniq.length} total users"
    end
  end

  def display_how_many_returns(records)
    puts "Websites with the most return visits:"
    records.each_with_index do |record, index|
      puts "#{index + 1}. #{record.path}: #{record.ip.length - record.ip.uniq.length} views"
    end
  end
end
