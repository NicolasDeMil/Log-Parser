require_relative "../lib/logs"

describe "Logs", :logs do

  let(:file_path) { "spec/test.log" }

  describe "#initialize" do
    it "should not crash if the file does not exist." do
      expect { Logs.new('unexisting_file.log') }.not_to raise_error
    end

    it "should store records in memory in an instance variable `@records`" do
      repo = Logs.new(file_path)
      expect(repo.records).to be_a(Array)
    end

    it "should load records correctly" do
      repo = Logs.new(file_path)
      expect(repo.records.length).to eq(6)
    end

    it "should set uniqueness correctly" do
      repo = Logs.new(file_path)
      expect(repo.records.first.unique).to eq(1)
    end
  end
end
