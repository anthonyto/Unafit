require 'rails_helper'

RSpec.describe GymsController, :type => :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET index" do
    let(:request) do 
     { 
       :location => 
        { 
          :latitude => 43.076342, 
          :longitude => -89.411914
        }
      }
    end
    it "responds successfully with an HTTP 200 status code" do 
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    context "no user" do 
      it "assigns all gyms as @gyms" do 
        gym1, gym2 = create(:gym), create(:gym)
        get :index
        expect(assigns(:gyms)).to match_array([gym1, gym2])
      end
      it "sets request location as the center" do
        gym = create(:gym)
        get :index
        expect(assigns(:center)).to eq([request.location.latitude, request.location.longitude])
      end
    end
    context "administrator" do 
      login_admin
      context "in development environment" do 
        it "assigns all gyms as @gyms" do 
          gym1, gym2 = create(:gym), create(:gym)
          get :index
          expect(assigns(:gyms)).to match_array([gym1, gym2])
        end
        it "sets first gym as the center" do
          gym = create(:gym)
          get :index
          expect(assigns(:center)).to eq([gym.latitude, gym.longitude])
        end
      end
    end
  end

  describe "GET show" do
    it "assigns the requested gym as @gym" do
      gym = Gym.create! valid_attributes
      get :show, {:id => gym.to_param}, valid_session
      expect(assigns(:gym)).to eq(gym)
    end
  end

  describe "GET new" do
    it "assigns a new gym as @gym" do
      get :new, {}, valid_session
      expect(assigns(:gym)).to be_a_new(Gym)
    end
  end

  describe "GET edit" do
    it "assigns the requested gym as @gym" do
      gym = Gym.create! valid_attributes
      get :edit, {:id => gym.to_param}, valid_session
      expect(assigns(:gym)).to eq(gym)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gym" do
        expect {
          post :create, {:gym => valid_attributes}, valid_session
        }.to change(Gym, :count).by(1)
      end

      it "assigns a newly created gym as @gym" do
        post :create, {:gym => valid_attributes}, valid_session
        expect(assigns(:gym)).to be_a(Gym)
        expect(assigns(:gym)).to be_persisted
      end

      it "redirects to the created gym" do
        post :create, {:gym => valid_attributes}, valid_session
        expect(response).to redirect_to(Gym.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gym as @gym" do
        post :create, {:gym => invalid_attributes}, valid_session
        expect(assigns(:gym)).to be_a_new(Gym)
      end

      it "re-renders the 'new' template" do
        post :create, {:gym => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gym" do
        gym = Gym.create! valid_attributes
        put :update, {:id => gym.to_param, :gym => new_attributes}, valid_session
        gym.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested gym as @gym" do
        gym = Gym.create! valid_attributes
        put :update, {:id => gym.to_param, :gym => valid_attributes}, valid_session
        expect(assigns(:gym)).to eq(gym)
      end

      it "redirects to the gym" do
        gym = Gym.create! valid_attributes
        put :update, {:id => gym.to_param, :gym => valid_attributes}, valid_session
        expect(response).to redirect_to(gym)
      end
    end

    describe "with invalid params" do
      it "assigns the gym as @gym" do
        gym = Gym.create! valid_attributes
        put :update, {:id => gym.to_param, :gym => invalid_attributes}, valid_session
        expect(assigns(:gym)).to eq(gym)
      end

      it "re-renders the 'edit' template" do
        gym = Gym.create! valid_attributes
        put :update, {:id => gym.to_param, :gym => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gym" do
      gym = Gym.create! valid_attributes
      expect {
        delete :destroy, {:id => gym.to_param}, valid_session
      }.to change(Gym, :count).by(-1)
    end

    it "redirects to the gyms list" do
      gym = Gym.create! valid_attributes
      delete :destroy, {:id => gym.to_param}, valid_session
      expect(response).to redirect_to(gyms_url)
    end
  end

end
