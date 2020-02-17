require_relative "../lib/record"

describe "Record", :record do
  it "should be initialized with a hash of properties" do
    attributes = { path: '/home', ip: '8.8.8.8' }
		record = Record.new(attributes)
		expect(record).to be_a(Record)
	end

	describe "#path" do
   it "should return the record path" do
     record = Record.new({ path: '/home' })
     expect(record.path).to eq('/home')
   end
 end

 describe "#ip" do
   it "should return the record ip list" do
     record = Record.new({ ip: '8.8.8.8' })
     expect(record.ip).to eq('8.8.8.8')
   end
 end

 describe "#unique=" do
   it "should set the unique value" do
     record = Record.new({ unique: 5 })
     record.unique = 10
     expect(record.unique).to eq(10)
   end
 end
end
