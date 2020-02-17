require_relative "view"

class Controller
  def initialize(logs)
    @logs = logs
    @view = View.new
  end

  # USER ACTIONS

  # Show all websites
  def list
    websites = @logs.records
    @view.show(websites)
  end

  # Show websites with total views
  def most_viewed
    records = @logs.records.sort_by { |record| record.ip.length }.reverse
    @view.display_most_viewed(records)
  end

  # Show websites with unique visitors
  def most_unique
    records = @logs.records.sort_by(&:unique).reverse
    @view.display_most_unique(records)
  end

  # Show websites with how many indivivual(new) users
  def how_many_users
    records = @logs.records.sort_by { |record| record.ip.uniq.length }.reverse
    @view.display_how_many_users(records)
  end

  # Show websites with how many return users
  def how_many_returns
    records = @logs.records.sort_by { |record| record.ip.length - record.ip.uniq.length }.reverse
    @view.display_how_many_returns(records)
  end
end
