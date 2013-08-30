require 'spec_helper'

describe "Person pages" do

  describe "profile page" do
    let(:person) { FactoryGirl.create(:person) }

    before { visit person_path(person) }
    
    it { should have_content(person.first_name) }
    it { should have_content(person.last_name) }
    it { should have_title("#{person.first_name} #{person.last_name}") }
  end    
end
