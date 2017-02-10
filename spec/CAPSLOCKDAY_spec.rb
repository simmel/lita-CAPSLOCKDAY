require "lita-CAPSLOCKDAY"
require "lita/rspec"
require "time"

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

describe Lita::Handlers::CAPSLOCKDAY, lita_handler: true do

  it "SHOULD CELEBRATE 26/6" do
    time_now = Time.parse("2016-06-28")
    allow(Time).to receive(:now).and_return(time_now)
		expect(robot.IT_IS_CAPSLOCKDAY?).to eq(true)
  end

  it "SHOULD CELEBRATE 26/6" do
    time_now = Time.parse("2016-10-22")
    allow(Time).to receive(:now).and_return(time_now)
		expect(robot.IT_IS_CAPSLOCKDAY?).to eq(true)
  end

  it "SHOULD ENABLE CRUISECONTROL" do
    strings = %w(cruisecontrol for cool)
		expect(robot.APPLY_CRUISECONTROL_FOR_COOL(*strings)).to eq(strings.map { |s| s.upcase })
  end

end
