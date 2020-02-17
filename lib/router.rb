class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "WELCOME TO YOUR LOG PARSER"
    puts "            --            "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.most_viewed
    when 3 then @controller.most_unique
    when 4 then @controller.how_many_users
    when 5 then @controller.how_many_returns
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, or 6"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all webpages"
    puts "2 - List most viewed webpages"
    puts "3 - List how many unique users per page"
    puts "4 - List how many total users per page"
    puts "5 - List how many return views per page"
    puts "6 - Stop and exit the program"
    print "> "
  end
end
