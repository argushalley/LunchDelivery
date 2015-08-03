require 'rails_helper'

RSpec.describe Admin::MeatsController, type: :controller do
  login_admin

  describe "GET #index" do
    it "assigns @meats" do
      meat = create(:meat)

      get :index

      expect(assigns(:meats)).to eq([meat])
    end

    it "renders the :index view" do
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested meat to @meat" do
      meat = create(:meat)

      get :show, id: meat

      expect(assigns(:meat)).to eq(meat)
    end

    it "renders the #show view" do
      get :show, id: create(:meat)

      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the #new view" do
      get :new

      expect(response).to render_template :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new meat" do
        expect{
          post :create, meat: attributes_for(:meat)
        }.to change(Meat, :count).by(1)
      end

      it "redirects to the new meat" do
        post :create, meat: attributes_for(:meat)

        expect(response).to redirect_to("/admin/meats/#{Meat.last.id}")
      end
    end

    context "with invalid attributes" do
      it "does not save the new meat" do
        expect{
          post :create, meat: attributes_for(:meat, name: nil)
        }.to_not change(Meat, :count)
      end

      it "re-renders the new method" do
        post :create, meat: attributes_for(:meat, name: nil)

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let!(:meat) { create(:meat, name: "Meat01") }

    context "with valid attributes" do
      it "located the requested meat" do
        put :update, id: meat, meat: attributes_for(:meat)

        expect(assigns(:meat)).to eq(meat)
      end

      it "changes meat's attributes" do
        put :update, id: meat, meat: attributes_for(:meat, name: "Meat02")

        meat.reload

        expect(meat.name).to eq("Meat02")
        expect(meat.name).to_not eq("Meat01")
      end

      it "redirects to the updated meat" do
        put :update, id: meat, meat: attributes_for(:meat)

        expect(response).to redirect_to("/admin/meats/#{meat.id}")
      end
    end

    context "with invalid attributes" do
      it "locates the requested meat" do
        put :update, id: meat, meat: attributes_for(:meat, name: nil)

        expect(assigns(:meat)).to eq(meat)
      end

      it "does not change meat's attributes" do

        put :update, id: meat, meat: attributes_for(:meat, name: nil)

        meat.reload

        expect(meat.name).to_not be_nil
        expect(meat.name).to eq("Meat01")
      end

      it "re-renders the edit method" do
        put :update, id: meat, meat: attributes_for(:meat, name: nil)

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:meat) { create(:meat) }

    it "deletes the meat" do
      expect{
        delete :destroy, id: meat
      }.to change(Meat, :count).by(-1)
    end

    it "redirects to admin/meats#index" do
      delete :destroy, id: meat

      expect(response).to redirect_to admin_meats_path
    end
  end
end
