require 'spec_helper'

describe "Person pages" do

  subject { page }

  describe "profile page" do
    let(:person) { FactoryGirl.create(:person) }

    before { visit person_path(person) }
    
    it { should have_content(person.name) }
    it { should have_title(person.name) }
  end    

  describe "new person page" do
    
    before { visit new_person_path }

    it { should have_content('Create new person') }
    it { should have_title(full_title('Create new person')) }
  end  

  describe "creating a new person" do

    before { visit new_person_path }

    let(:submit) { "Create new person" }

    describe "with invalid information" do
      it "should not create a person" do
        expect { click_button submit }.not_to change(Person, :count)
      end
    end  

    describe "with valid information" do
      before do
        fill_in "First name", with: "Alfredo"
        fill_in "Last name",  with: "Pantoja"
      end

      it "should create a person" do
        expect { click_button submit }.to change(Person, :count).by(1)
      end
    end
  end  
end
