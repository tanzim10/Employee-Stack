require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
    # Simulate a logged-in user
    before do
      Current.user = User.new
    end
    
    describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new employee as @employee' do
      get :new
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

   
  
    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates a new employee' do
          expect {
            post :create, params: { employee: { first_name: 'Tanzim', last_name: 'Farhan', email: 'tanzimfarhan@gmail.com', number: 34023923, address: '78223 Main St' } }
          }.to change(Employee, :count).by(1)
        end
  
        it 'redirects to the employee index' do
          post :create, params: { employee: { first_name: 'Tanzim', last_name: 'Farhan', email: 'tanzimfarhan@gmail.com', number: 34023923, address: '78223 Main St' } }
          expect(response).to redirect_to(employees_path)
        end
      end
  
      context 'with invalid attributes' do
        it 'does not save the new employee' do
          expect {
            post :create, params: { employee: { first_name: '', last_name: '', email: 'invalid_email', number: 'invalid', address: '' } }
          }.not_to change(Employee, :count)
        end
      end
    end
  
    describe 'DELETE #destroy' do
      let!(:employee) { Employee.create(first_name: 'Tanzim', last_name: 'Farhan', email: 'tanzimfarhan@gmail.com', number: 7238410, address: '3242 Main St') }
  
      it 'deletes the employee' do
        expect {
          delete :destroy, params: { id: employee.id }
        }.to change(Employee, :count).by(-1)
      end
  
      it 'redirects to the employee index' do
        delete :destroy, params: { id: employee.id }
        expect(response).to redirect_to(employees_path)
      end
    end
  end





    



