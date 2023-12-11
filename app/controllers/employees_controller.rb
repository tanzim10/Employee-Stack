class EmployeesController < ApplicationController
  def index
    if !Current.user
        redirect_to login_path, alert: "You must be signed in to do that."
    else
        @employee = Employee.all

    end

  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee was successfully created."
    else
        redirect_to new_employee_path, alert: "Employee was not created."
    end
  end
  
  def destroy
    @employee = Employee.find_by(id: params[:id])
    if @employee.destroy
      redirect_to employees_path, notice: "Employee was successfully deleted."
    else
      redirect_to employees_path, alert: "Employee was not deleted."
    end
  end

  def edit
    @employee = Employee.find_by(id: params[:id])
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Employee was successfully updated."
    else
      redirect_to employees_path, alert: "Employee was not updated."
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :number, :address)
  end

    


end
