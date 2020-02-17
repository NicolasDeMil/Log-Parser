require_relative "record"

class Logs
  attr_reader :records
  def initialize(log_file)
    @records = []
    @log_file = log_file
    load_file if File.exist?(@log_file)
    uniqueness if File.exist?(@log_file)
  end

  private

  def load_file
    data = {}
    paths = []
    File.open(@log_file).each do |line|
      path = line.split[0]
      ip = line.split[1]

      if paths.include?(path)
        data[path] << ip
      else
        paths << path
        data[path] = [ip]
      end
    end

    data.each do |path, ip|
      @records << Record.new(path: path, ip: ip)
    end
  end

  def uniqueness
    @records.each do |record|
      u_ips = []
      ips = []
      record.ip.each do |ip|
        if u_ips.include?(ip)
          u_ips.delete(ip)
          ips << ip
        elsif ips.include?(ip)
          next
        else
          u_ips << ip
        end
      end
      record.unique = u_ips.length
    end
  end
end
