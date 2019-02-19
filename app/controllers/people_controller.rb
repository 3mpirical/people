class PeopleController < ApplicationController
  def index
    @people = Person.all()
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new()
  end

  def create
    @person = Person.new(person_params())

    if(@person.save())
      redirect_to(person_path)
    else
      render(:new)
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if( @person.update(person_params()) )
      redirect_to(person_path)
    else
      render(:edit)
    end
  end

  def destroy
    Person.destroy(params[:id])
    redirect_to(people_path)
  end

  private
    def person_params
      return params.require(:person).permit(:name, :age, :hair_color, :eye_color, :gender, :alive)
    end
end
