class EmployeeBackupsController < ApplicationController

  def index
    @employee_backups = EmployeeBackup.all
  end
  
end
