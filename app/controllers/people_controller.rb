class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end  

  def new
    @person = Person.new
  end  

  def create
    @person = Person.new(person_params) 
    if @person.save
      flash[:success] = "Welcome to the Contact Manager!"
      redirect_to @person
    else 
      render 'new'
    end
  end  

  private 

    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end  
end  
