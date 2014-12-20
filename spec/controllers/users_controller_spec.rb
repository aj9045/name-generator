require "rails_helper"

describe UsersController do
  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "the Get routes" do
    describe "Get #show" do
      it "locates the correct/requested user" do
        get :show, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "renders :show template" do
        get :show, id: @user_id
        expect(response).to render_template(:show)
      end
    end

    describe "Get #edit" do
      it "locates the correct/requested user" do
        get :edit, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "renders :edit template (with update form)" do
        get :edit, id: @user_id
        expect(response).to render_template(:edit)
      end
    end

    describe "Get #new" do
      it "assigns a new user" do
        get :new, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "renders :new template (with create form)" do
        get :new, id: @user_id
        expect(response).to render_template(:new)
      end
    end

  end

  describe "Post #create" do
  end

  describe "Put #update" do
  end

  describe "Delete #destroy" do
  end

end
