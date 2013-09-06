require 'spec_helper'

describe "Person pages" do

  subject { page }

  describe "index" do
    let(:person) { FactoryGirl.create(:person) }
    before(:each) do
      visit people_path
    end

    it { should have_title("All people") }
    it { should have_content("All people") }

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:person) } }
      after(:all)  { Person.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each person" do
        Person.paginate(page: 1).each do |person|
          expect(page).to have_selector('li', text: person.name)
        end
      end
    end  

    describe "delete links" do
      before do
        visit people_path
      end

      it { should have_link('delete', href: person_path(Person.first)) }
      it "should be able to delete another user" do
        expect do
          click_link('delete', match: :first)
        end.to change(Person, :count).by(-1)  
      end
      #it { should_not have_link('delete', href: person_path(person)) }
    end  
  end  

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

  describe "edit" do
    let(:person) { FactoryGirl.create(:person) }
    before { visit edit_person_path(person) }

    describe "page" do
      it { should have_content("Edit person") }
      it { should have_title("Edit person") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_first_name) { "New First Name"}
      let(:new_last_name)  { "New Last Name"}
      before do
        fill_in "First name", with: new_first_name
        fill_in "Last name",  with: new_last_name
        click_button "Save changes"
      end

      it { should have_title("#{new_first_name} #{new_last_name}") }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(person.reload.first_name).to eq new_first_name }
      specify { expect(person.reload.last_name).to eq new_last_name }
    end  
  end  
end
