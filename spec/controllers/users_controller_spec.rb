require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_session) { {} }
  
  context 'client' do 
    login_client
    describe "GET index" do
      it "is unauthorized" do 
        get :index 
        expect(response).to redirect_to(errors_unauthorized_path)
        expect(response).to have_http_status(403)
      end
    end
  end
  
  context 'manager' do 
  end
  
  context 'admin' do 
    login_admin
    describe "Get index" do 
      it "is successful" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
      
      it "loads all users into @users" do
        @users = User.all
        get :index
        expect(assigns(:users)).to match(@users)
      end
    end
  end

  # describe "GET index" do
#     it "assigns all users as @users" do
#       user = User.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:users)).to eq([user])
#     end
#   end
#
#   describe "GET show" do
#
#     it "assigns the requested user as @user" do
#       user = User.create! valid_attributes
#       get :show, {:id => user.to_param}, valid_session
#       expect(assigns(:user)).to eq(user)
#     end
#   end
#
#   describe "GET new" do
#     it "assigns a new user as @user" do
#       get :new, {}, valid_session
#       expect(assigns(:user)).to be_a_new(User)
#     end
#   end
#
#   describe "GET edit" do
#     it "assigns the requested user as @user" do
#       user = User.create! valid_attributes
#       get :edit, {:id => user.to_param}, valid_session
#       expect(assigns(:user)).to eq(user)
#     end
#   end
#
#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new User" do
#         expect {
#           post :create, {:user => valid_attributes}, valid_session
#         }.to change(User, :count).by(1)
#       end
#
#       it "assigns a newly created user as @user" do
#         post :create, {:user => valid_attributes}, valid_session
#         expect(assigns(:user)).to be_a(User)
#         expect(assigns(:user)).to be_persisted
#       end
#
#       it "redirects to the created user" do
#         post :create, {:user => valid_attributes}, valid_session
#         expect(response).to redirect_to(User.last)
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved user as @user" do
#         post :create, {:user => invalid_attributes}, valid_session
#         expect(assigns(:user)).to be_a_new(User)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, {:user => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end
#
#   describe "PUT update" do
#     describe "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }
#
#       it "updates the requested user" do
#         user = User.create! valid_attributes
#         put :update, {:id => user.to_param, :user => new_attributes}, valid_session
#         user.reload
#         skip("Add assertions for updated state")
#       end
#
#       it "assigns the requested user as @user" do
#         user = User.create! valid_attributes
#         put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
#         expect(assigns(:user)).to eq(user)
#       end
#
#       it "redirects to the user" do
#         user = User.create! valid_attributes
#         put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
#         expect(response).to redirect_to(user)
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns the user as @user" do
#         user = User.create! valid_attributes
#         put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
#         expect(assigns(:user)).to eq(user)
#       end
#
#       it "re-renders the 'edit' template" do
#         user = User.create! valid_attributes
#         put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE destroy" do
#     it "destroys the requested user" do
#       user = User.create! valid_attributes
#       expect {
#         delete :destroy, {:id => user.to_param}, valid_session
#       }.to change(User, :count).by(-1)
#     end
#
#     it "redirects to the users list" do
#       user = User.create! valid_attributes
#       delete :destroy, {:id => user.to_param}, valid_session
#       expect(response).to redirect_to(users_url)
#     end
#   end

end
