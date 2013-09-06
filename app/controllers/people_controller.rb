class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end  

  def index
    @people = Person.paginate(page: params[:page])
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

  def edit
    @person = Person.find(params[:id])
  end  

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      flash[:success] = "Person updated"
      redirect_to @person
    else
      render 'edit' 
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    flash[:success] = "Person destroyed."
    redirect_to people_url
  end  

  private 

    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end  
end  
