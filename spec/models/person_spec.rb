require 'spec_helper'

describe Person do

  before do
    @person = Person.new(first_name: "Alfredo", last_name: "Pantoja")
  end

  subject { @person }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }

  it { should be_valid }
end
