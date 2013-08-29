require 'spec_helper'

describe Person do

  before do
    @person = Person.new(first_name: "Alfredo", last_name: "Pantoja")
  end

  subject { @person }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }

  it { should be_valid }

  describe "when first_name is not present" do
    before { @person.first_name = nil }
    it { should_not be_valid }
  end  

  describe "when last_name is not present" do
    before { @person.last_name = nil }
    it { should_not be_valid }
  end  
end
