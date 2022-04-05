require "./spec_helper"

some_object_extension(:not_nil_map)

describe Some do
  it "actual value is mapped (with object extension)" do
    result = 10.not_nil_map do |value|
      fail("Invalid value") unless value == 10
      value.to_s
    end
    result.should eq "10"
  end
end
