namespace :employee_backup do
  desc "Backup daily records from Employee table to EmplooyeeBackup table"
  task backup: :environment do
    Employee.find_each do |employee|
        EmployeeBackup.create!(employee.attributes.except("id", "created_at", "updated_at"))
    end
    Employee.delete_all
  end
end

