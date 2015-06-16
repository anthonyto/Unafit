require 'rails_helper'

RSpec.describe GymsController, :type => :controller do
  
  let(:valid_attributes) { {
    "name" => "foo",
    "email" => "foo@bar.com",
    "phone_number" => "1112223333",
    "city" => "Madison",
    "state" => "WI",
    "street" => "773 University Avenue",
    "zip" => "57315",
    "two_gym_passes" => 8,
    "three_gym_passes" => 6,
    "four_gym_passes" => 4,
    "description" => "foobarfoo"
    } }
    
    let(:new_attributes) { {
      "name" => "new name"
      } }
  
  let(:madison_gym) { FactoryGirl.create(:madison_gym) }
  let(:san_diego_gym) { FactoryGirl.create(:san_diego_gym) }
  
  # This is a great example of index tests!!
  # context "no user" do
  #   it "assigns all gyms as @gyms" do
  #     gym1, gym2 = create(:gym), create(:gym)
  #     get :index
  #     expect(assigns(:gyms)).to match_array([gym1, gym2])
  #   end
  #   it "sets request location as the center" do
  #     gym = create(:gym)
  #     get :index
  #     expect(assigns(:center)).to eq([request.location.latitude, request.location.longitude])
  #   end
  # end
  
  context "guest" do 
    # I can't figure out how to set the request.location, which comes with Ruby Geocoder
    # Neither one of these is working
    # let(:request) { ActionController::TestRequest.new(:latitude => "43.076342", :longitude => "-89.411914") }
    # before(:each) do
    #   request.location.latitude = 43.076342
    #   request.location.longitude = -89.411914
    # end
    describe "GET index" do
      before(:each) { get :index }
      # it "is successful" do
      #   expect(response).to be_successful
      #   expect(response).to have_http_status(200)
      # end
      # it "sets request location as the center" do
      #   expect(assigns(:center)).to eq([request.location.latitude, request.location.longitude])
      # end
      # it "sets madison gym as @gyms" do
      #   expect(assigns(:gyms)).to match(madison_gym)
      # end
    end
    describe "GET show" do
      before(:each) { get :show, id: madison_gym.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "assigns the requested gym as @gym" do 
        expect(assigns(:gym)).to eq(madison_gym)
      end
      it "assigns gyms.pictures as @pictures" do 
        pictures = madison_gym.pictures
        expect(assigns(:pictures)).to eq(pictures)
      end
    end
    describe "GET new" do
      before(:each) { get :new }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET edit" do
      before(:each) { get :edit, id: madison_gym.id }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "POST create" do
      before(:each) { post :create, {:gym => valid_attributes} }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "PATCH update" do
      before(:each) { patch :update, {id: madison_gym.id, :gym => new_attributes} }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "GET check_in_client" do
      let(:user) { FactoryGirl.create(:client_with_subscriptions) }
      before(:each) { get :check_in_client, { id: madison_gym.id, user_id: user.id } }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "DELETE destroy" do
      before(:each) { delete :destroy, id: madison_gym.id }
      it "is redirects to login" do 
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it "redirects to login page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
  
  # This is weird, why are some of these redirecting and some unauthorized?
  context "client" do 
    login(:client)
    describe "GET index" do
      before(:each) { get :index }
      # it "is successful" do
      #   expect(response).to be_successful
      #   expect(response).to have_http_status(200)
      # end
      # it "sets madison gym as @gyms" do
      #   expect(assigns(:gyms)).to match(madison_gym)
      # end
    end
    describe "GET show" do
      before(:each) { get :show, id: madison_gym.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "assigns the requested gym as @gym" do 
        expect(assigns(:gym)).to eq(madison_gym)
      end
      it "assigns gyms.pictures as @pictures" do 
        pictures = madison_gym.pictures
        expect(assigns(:pictures)).to eq(pictures)
      end
    end
    describe "GET new" do
      before(:each) { get :new }
      it "is unauthorized" do 
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "GET edit" do
      before(:each) { get :edit, id: madison_gym.id }
      it "is redirected" do 
        expect(response).to have_http_status(302)
      end
      it "redirect to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
    describe "POST create" do
      before(:each) { post :create, {:gym => valid_attributes} }
      it "is unauthorized" do 
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "PATCH update" do
      before(:each) { patch :update, {id: madison_gym.id, :gym => new_attributes} }
      it "is redirected" do 
        expect(response).to have_http_status(302)
      end
      it "redirect to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
    describe "GET check_in_client" do
      let(:user) { FactoryGirl.create(:client_with_subscriptions) }
      before(:each) { get :check_in_client, { id: madison_gym.id, user_id: user.id } }
      it "is redirected" do 
        expect(response).to have_http_status(302)
      end
      it "redirect to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
    describe "DELETE destroy" do
      before(:each) { delete :destroy, id: madison_gym.id }
      it "is redirected" do 
        expect(response).to have_http_status(302)
      end
      it "redirect to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
  end 
  
  context "manager" do
    login(:manager)
    describe "GET index" do
    end
    describe "GET show" do
      before(:each) { get :show, id: madison_gym.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "assigns the requested gym as @gym" do 
        expect(assigns(:gym)).to eq(madison_gym)
      end
      it "assigns gyms.pictures as @pictures" do 
        pictures = madison_gym.pictures
        expect(assigns(:pictures)).to eq(pictures)
      end
    end
    describe "GET new" do
      before(:each) { get :new }
      it "is unauthorized" do 
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "GET edit" do
      context "manager's gym" do 
        before(:each) { get :edit, id: @user.managed_gym.id }
        it "is successful" do 
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "sets the requested gym as @gym" do 
          expect(assigns(:gym)).to eq(@user.managed_gym)
        end
        it "renders the edit gym view" do
          expect(response).to render_template("edit")
        end
      end
      context "random gym" do 
        before(:each) { get :edit, id: madison_gym.id }
        it "redirects" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "redirects to unauthorized" do
          expect(response).to redirect_to errors_unauthorized_path
        end
      end
    end
    describe "POST create" do
      before(:each) { post :create, {:gym => valid_attributes} }
      it "is unauthorized" do 
        expect(response).to have_http_status(403)
      end
      it "renders errors/unauthorized" do
        expect(response).to render_template("errors/unauthorized")
      end
    end
    describe "PATCH update" do
      context "manager's gym" do 
        before(:each) do
           put :update, {id: @user.managed_gym.id, :gym => new_attributes }
           @user.managed_gym.reload
        end
        it "redirects to newly updated gym" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "sets the requested gym as @gym" do 
          expect(assigns(:gym)).to eq(@user.managed_gym)
        end
        it "responds with the gym" do
          expect(response).to redirect_to gym_path(@user.managed_gym)
        end
        it "updates the new name of the gym" do
          expect(@user.managed_gym.name).to eq "New Name"
        end
      end
      context "random gym" do 
        before(:each) do
           put :update, {id: madison_gym.id, :gym => new_attributes }
           madison_gym.reload
        end
        it "redirects" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "redirects to unauthorized" do
          expect(response).to redirect_to errors_unauthorized_path
        end
      end
    end
    describe "GET check_in_client" do
      let(:client) { FactoryGirl.create(:client_with_subscriptions) }
      context "manager's gym" do 
        before(:each) { get :check_in_client, { id: @user.managed_gym.id, user_id: client.id } }
        it "redirects" do 
          expect(response).to be_redirect
          expect(response).to have_http_status(302)
        end
        it "redirects to unauthorized" do
          expect(response).to redirect_to user_path(user)
        end
      end
      context "random gym" do 
        before(:each) { get :check_in_client, { id: madison_gym.id, user_id: client.id } }
        pending("Do we really need to test this?")
      end
    end
    describe "DELETE destroy" do
      before(:each) { delete :destroy, id: madison_gym.id }
      it "is redirects" do 
        expect(response).to have_http_status(302)
      end
      it "redirects to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
  end

  context "admin" do
    login(:admin)
    describe "GET index" do
    end
    describe "GET show" do
      before(:each) { get :show, id: madison_gym.id }
      it "is successful" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "assigns the requested gym as @gym" do 
        expect(assigns(:gym)).to eq(madison_gym)
      end
      it "assigns gyms.pictures as @pictures" do 
        pictures = madison_gym.pictures
        expect(assigns(:pictures)).to eq(pictures)
      end
    end
    describe "GET new" do
      before(:each) { get :new }
    end
    # Admin cannot currently access this page, this is wrong and I don't know why thats happening
    describe "GET edit" do
      before(:each) { get :edit, id: madison_gym.id }
    end
    describe "POST create" do
      before(:each) { post :create, {:gym => valid_attributes} }
    end
    describe "PATCH update" do
      before(:each) { patch :update, {id: madison_gym.id, :gym => new_attributes} }
    end
    describe "GET check_in_client" do
      let(:user) { FactoryGirl.create(:client_with_subscriptions) }
      before(:each) { get :check_in_client, { id: madison_gym.id, user_id: user.id } }
      it "is redirects" do 
        expect(response).to have_http_status(302)
      end
      it "redirects to errors/unauthorized" do
        expect(response).to redirect_to errors_unauthorized_path
      end
    end
    describe "DELETE destroy" do
      before(:each) { delete :destroy, id: madison_gym.id }
    end
  end
end
  
#   describe "GET new" do
#     it "assigns a new gym as @gym" do
#       get :new, {}, valid_session
#       expect(assigns(:gym)).to be_a_new(Gym)
#     end
#   end
#
#   describe "GET edit" do
#     it "assigns the requested gym as @gym" do
#       gym = Gym.create! valid_attributes
#       get :edit, {:id => gym.to_param}, valid_session
#       expect(assigns(:gym)).to eq(gym)
#     end
#   end
#
#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new Gym" do
#         expect {
#           post :create, {:gym => valid_attributes}, valid_session
#         }.to change(Gym, :count).by(1)
#       end
#
#       it "assigns a newly created gym as @gym" do
#         post :create, {:gym => valid_attributes}, valid_session
#         expect(assigns(:gym)).to be_a(Gym)
#         expect(assigns(:gym)).to be_persisted
#       end
#
#       it "redirects to the created gym" do
#         post :create, {:gym => valid_attributes}, valid_session
#         expect(response).to redirect_to(Gym.last)
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved gym as @gym" do
#         post :create, {:gym => invalid_attributes}, valid_session
#         expect(assigns(:gym)).to be_a_new(Gym)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, {:gym => invalid_attributes}, valid_session
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
#       it "updates the requested gym" do
#         gym = Gym.create! valid_attributes
#         put :update, {:id => gym.to_param, :gym => new_attributes}, valid_session
#         gym.reload
#         skip("Add assertions for updated state")
#       end
#
#       it "assigns the requested gym as @gym" do
#         gym = Gym.create! valid_attributes
#         put :update, {:id => gym.to_param, :gym => valid_attributes}, valid_session
#         expect(assigns(:gym)).to eq(gym)
#       end
#
#       it "redirects to the gym" do
#         gym = Gym.create! valid_attributes
#         put :update, {:id => gym.to_param, :gym => valid_attributes}, valid_session
#         expect(response).to redirect_to(gym)
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns the gym as @gym" do
#         gym = Gym.create! valid_attributes
#         put :update, {:id => gym.to_param, :gym => invalid_attributes}, valid_session
#         expect(assigns(:gym)).to eq(gym)
#       end
#
#       it "re-renders the 'edit' template" do
#         gym = Gym.create! valid_attributes
#         put :update, {:id => gym.to_param, :gym => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE destroy" do
#     it "destroys the requested gym" do
#       gym = Gym.create! valid_attributes
#       expect {
#         delete :destroy, {:id => gym.to_param}, valid_session
#       }.to change(Gym, :count).by(-1)
#     end
#
#     it "redirects to the gyms list" do
#       gym = Gym.create! valid_attributes
#       delete :destroy, {:id => gym.to_param}, valid_session
#       expect(response).to redirect_to(gyms_url)
#     end
#   end