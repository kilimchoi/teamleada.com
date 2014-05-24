# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  value       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_type   :string(255)
#  enabled     :boolean          default(TRUE)
#  access_type :string(255)
#

require 'spec_helper'

describe Code do

  before :each do
    @code = Code.new(
      value: "12345678",
      user_type: "test",
      enabled: true,
      access_type: "project-access",
    )
  end

  describe "#value" do
    it "returns the correct value" do
      @code.value.should eql "12345678"
    end
  end

  describe "#user_type" do
    it "returns the correct value" do
      @code.user_type.should eql "test"
    end
  end

  describe "#enabled" do
    it "returns the correct value" do
      @code.enabled.should be_true
    end
  end

  describe "#access_type" do
    it "returns the correct value" do
      @code.access_type.should eql "project-access"
    end
  end

end
