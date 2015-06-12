require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  
  context 'client' do 
    
    describe "GET index" do
      login(:client)
      before(:each) { get :index }
      it "is unauthorized" do 
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    
    describe "GET show" do 
      context "no client profile" do 
        login(:client)
        before(:each) { get :show, id: @user.id }
        it "is successful" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "renders the new client_profile view" do 
          expect(response).to redirect_to new_user_client_profile_path(@user.id)
        end
      end
      context "has client profile" do 
        login(:client_with_client_profile)
        before(:each) { get :show, id: @user.id }
        it "is successful" do 
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "renders the client dashboard" do 
          expect(response).to render_template("show_client")
        end
      end
      context "subscribed" do 
        login(:client_with_subscriptions)
        before(:each) { get :show, id: @user.id }
        it "loads users subscriptions as @subscriptions" do 
          @subscriptions = @user.subscriptions
          expect(assigns(:subscriptions)).to match(@subscriptions)
        end
      end
    end
    
  end
  
  context 'manager' do 
    login(:manager)
    describe "GET index" do 
      before(:each) { get :index }
      it "is unauthorized" do
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    
    describe "GET show" do 
      login(:manager)
      before(:each) { get :show, id: @user.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the manager dashboard" do 
        expect(response).to render_template("show_manager")
      end
      it "loads managed_gym as @gym" do 
        @gym = @user.managed_gym
        expect(assigns(:gym)).to match(@gym)
      end
      it "loads all managed_gyms.users as @users" do 
        @users = @user.managed_gym.users
        expect(assigns(:users)).to match(@users)
      end
    end
    
  end
  
  context 'admin' do 
    login(:admin)
    describe "GET index" do 
      before(:each) { get :index }
      it "is successful" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        expect(response).to render_template("index")
      end
      it "loads all users into @users" do
        @users = User.all
        expect(assigns(:users)).to match(@users)
      end
    end
    
    describe "GET show" do 
      before(:each) { get :show, id: @user.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the admin dashboard" do 
        expect(response).to render_template("show_admin")
      end
      it "loads all gyms as @gyms" do 
        @gyms = Gym.all
        expect(assigns(:gyms)).to match(@gyms)
      end
      it "loads total number of users as @num_users" do 
        @num_users = User.count
        expect(assigns(:num_users)).to match(@num_users)
      end
    end
  end

end

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
