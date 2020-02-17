require_relative "../lib/controller"


describe "CustomersController", :customer do

  let(:file_path) { "spec/test.log" }
  let(:logs) { Logs.new(file_path) }

  describe "#list" do
    it "should display the websites from the repository" do
      controller = Controller.new(logs)
      expect(STDOUT).to receive(:puts).with("Websites:")
      logs.records.each_with_index do |record, index|
        expect(STDOUT).to receive(:puts).with("#{index + 1}. #{record.path}")
      end
      controller.list
    end
  end

  describe "#most_viewed" do
    it "should display the most viewed websites from the repository" do
      controller = Controller.new(logs)
      expect(STDOUT).to receive(:puts).with("Most visited websites:")
      logs.records.sort_by { |record| record.ip.length }.reverse.each_with_index do |record, index|
        expect(STDOUT).to receive(:puts).with("#{index + 1}. #{record.path}: #{record.ip.length} total views")
      end
      controller.most_viewed
    end
  end

  describe "#most_unique" do
    it "should display the websites with the most unique views from the repository" do
      controller = Controller.new(logs)
      expect(STDOUT).to receive(:puts).with("Websites with the most unique views:")
      logs.records.sort_by(&:unique).reverse.each_with_index do |record, index|
        expect(STDOUT).to receive(:puts).with("#{index + 1}. #{record.path}: #{record.unique} unique users")
      end
      controller.most_unique
    end
  end

  describe "#how_many_users" do
    it "should display the number of users per website" do
      controller = Controller.new(logs)
      expect(STDOUT).to receive(:puts).with("Websites with the most users:")
      logs.records.sort_by { |record| record.ip.uniq.length }.reverse.each_with_index do |record, index|
        expect(STDOUT).to receive(:puts).with("#{index + 1}. #{record.path}: #{record.ip.uniq.length} total users")
      end
      controller.how_many_users
    end
  end

  describe "#how_many_returns" do
    it "should display the number of returning views per website" do
      controller = Controller.new(logs)
      expect(STDOUT).to receive(:puts).with("Websites with the most return visits:")
      logs.records.sort_by { |record| record.ip.length - record.ip.uniq.length }.reverse.each_with_index do |record, index|
        expect(STDOUT).to receive(:puts).with("#{index + 1}. #{record.path}: #{record.ip.length - record.ip.uniq.length} views")
      end
      controller.how_many_returns
    end
  end
end
