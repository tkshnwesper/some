require "./spec_helper"

describe Some do
  it "actual value is mapped" do
    result = Some.new(10).fmap do |value|
      fail("Invalid value") unless value == 10
      value.to_s
    end
    result.should eq "10"
  end

  it "value is nil" do
    result = Some.new(nil).fmap do
      fail("Should not enter block")
    end
    result.should be nil
  end
end
