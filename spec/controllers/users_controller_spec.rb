require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  
  context "guest" do
    describe "GET index" do
      before(:each) { get :index }
      it "is redirects" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to sign up page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET show" do 
      before(:each) { get :show, id: 1 }
      it "it redirects" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to sign up page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET edit_subscriptions" do 
      before(:each) { get :edit_subscriptions, id: 1 }
      it "is redirects" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to sign up page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "PATCH update" do
      before(:each) { patch :update, id: 1, user: { gym_ids: ["1"]} }
      it "is redirects" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to sign up page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
  
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
        it "redirects to client profile" do 
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
    describe "GET edit subscriptions" do 
      login(:client_with_client_profile)
      before(:each) { get :edit_subscriptions, id: @user.id }
      it "is successful" do 
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
      it "renders the edit view" do 
        expect(response).to render_template("edit_subscriptions")
      end
    end
    describe "PATCH update" do 
      login(:client_with_client_profile)
      context "with valid params" do 
        let(:gym) { FactoryGirl.create(:gym) }
        before(:each) { patch :update, id: @user.id, user: { gym_ids: [gym.id]} }
        it "it redirects" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "renders the client dashboard" do 
          expect(response).to redirect_to user_path(@user.id)
        end
        it "successfully updates subscriptions" do 
          @subscriptions = @user.subscriptions
          @subscription = Subscription.find_by(user_id: @user.id, gym_id: gym.id)
          expect(@subscriptions).to include @subscription
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
    describe "GET edit_subscriptions" do 
      login(:manager)
      before(:each) { get :edit_subscriptions, id: @user.id }
      it "is unauthorized" do
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "PATCH update" do
      login(:manager)
      let(:gym) { FactoryGirl.create(:gym) }
      before(:each) { patch :update, id: @user.id, user: { gym_ids: [gym.id]} }
      it "is unauthorized" do
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
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
    describe "GET edit_subscriptions" do 
      login(:admin)
      before(:each) { get :edit_subscriptions, id: @user.id }
      it "is unauthorized" do
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "PATCH update" do
      login(:admin)
      let(:gym) { FactoryGirl.create(:gym) }
      before(:each) { patch :update, id: @user.id, user: { gym_ids: [gym.id]} }
      it "is unauthorized" do
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
  end
end
