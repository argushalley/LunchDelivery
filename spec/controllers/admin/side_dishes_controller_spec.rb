require 'rails_helper'

RSpec.describe Admin::SideDishesController, type: :controller do
  login_admin

  describe "GET #index" do
    it "assigns @side_dishes" do
      side_dish = create(:side_dish)

      get :index

      expect(assigns(:side_dishes)).to eq([side_dish])
    end

    it "renders the :index view" do
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested side_dish to @side_dish" do
      side_dish = create(:side_dish)

      get :show, id: side_dish

      expect(assigns(:side_dish)).to eq(side_dish)
    end

    it "renders the #show view" do
      get :show, id: create(:side_dish)

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
      it "creates a new side_dish" do
        expect{
          post :create, side_dish: attributes_for(:side_dish)
        }.to change(SideDish, :count).by(1)
      end

      it "redirects to the new side_dish" do
        post :create, side_dish: attributes_for(:side_dish)

        expect(response).to redirect_to("/admin/side_dishes/#{SideDish.last.id}")
      end
    end

    context "with invalid attributes" do
      it "does not save the new side_dish" do
        expect{
          post :create, side_dish: attributes_for(:side_dish, name: nil)
        }.to_not change(SideDish, :count)
      end

      it "re-renders the new method" do
        post :create, side_dish: attributes_for(:side_dish, name: nil)

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    let!(:side_dish) { create(:side_dish, name: "SideDish01") }

    context "with valid attributes" do
      it "located the requested side_dish" do
        put :update, id: side_dish, side_dish: attributes_for(:side_dish)

        expect(assigns(:side_dish)).to eq(side_dish)
      end

      it "changes side_dishe's attributes" do
        put :update, id: side_dish, side_dish: attributes_for(:side_dish, name: "SideDish02")

        side_dish.reload

        expect(side_dish.name).to eq("SideDish02")
        expect(side_dish.name).to_not eq("SideDish01")
      end

      it "redirects to the updated side_dish" do
        put :update, id: side_dish, side_dish: attributes_for(:side_dish)

        expect(response).to redirect_to("/admin/side_dishes/#{side_dish.id}")
      end
    end

    context "with invalid attributes" do
      it "locates the requested side_dish" do
        put :update, id: side_dish, side_dish: attributes_for(:side_dish, name: nil)

        expect(assigns(:side_dish)).to eq(side_dish)
      end

      it "does not change side_dishe's attributes" do

        put :update, id: side_dish, side_dish: attributes_for(:side_dish, name: nil)

        side_dish.reload

        expect(side_dish.name).to_not be_nil
        expect(side_dish.name).to eq("SideDish01")
      end

      it "re-renders the edit method" do
        put :update, id: side_dish, side_dish: attributes_for(:side_dish, name: nil)

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:side_dish) { create(:side_dish) }

    it "deletes the side_dish" do
      expect{
        delete :destroy, id: side_dish
      }.to change(SideDish, :count).by(-1)
    end

    it "redirects to admin/side_dishes#index" do
      delete :destroy, id: side_dish

      expect(response).to redirect_to admin_side_dishes_path
    end
  end
end
