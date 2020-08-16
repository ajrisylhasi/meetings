class DepartmentsController < ApplicationController

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to users_path
    else
      @errors = []
      if @department.errors.any?
        @department.errors.full_messages.each do |msg|
          @errors.push msg
        end
      end
      redirect_to users_path(errors: @errors)
    end
  end

  def destroy
    @department= Department.find(params[:id])
    @department.destroy
    redirect_to users_path
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update 
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      redirect_to users_path                                                                                   
    else
      @errors = []
      if @department.errors.any?
        @department.errors.full_messages.each do |msg|
          @errors.push msg
        end
      end
      redirect_to edit_department_path(@department, errors: @errors)
    end
  end

  private

    def department_params 
      params.require(:department).permit(:name, :email, :password, :password_confirmation)
    end
end