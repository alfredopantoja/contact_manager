require 'spec_helper'

describe "Person pages" do

  subject { page }

  describe "profile page" do
    let(:person) { FactoryGirl.create(:person) }

    before { visit person_path(person) }
    
    it { should have_content(person.name) }
    it { should have_title(person.name) }
  end    
end
