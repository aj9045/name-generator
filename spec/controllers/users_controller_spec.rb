require "rails_helper"

describe UsersController, type: :controller do
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
        get :show, id: @user
        expect(response).to render_template(:show)
      end
    end

    describe "Get #edit" do
      it "locates the correct/requested user" do
        get :edit, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "renders :edit template (with update form)" do
        get :edit, id: @user
        expect(response).to render_template(:edit)
      end
    end

    describe "Get #new" do
      it "assigns a new user" do
        get :new, id: @user
        expect(assigns[:user]).to be_a_new(User)
      end

      it "renders :new template (with create form)" do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Post #create" do
    context "valid attributes" do
      it "saves user into database" do
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
      end

      it "redirects to root path" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end

      it "sets session for that user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(session[:user_id]).to_not be_nil
      end
    end
    context "invalid attributes" do
      it "doesn't save into the database" do
        expect { post :create, user: FactoryGirl.attributes_for(:invalid_user) }.to_not change(User, :count)
      end
      it "re-renders :new template" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put #update" do
    context "valid attributes" do
      it "locates the requested user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end
      it "changes users attributes" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, username: "Larry")
        @user.reload
        expect(@user.username).to eq("Larry")
      end
      it "redirects to the updated user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(@user)
      end
    end
    context "invalid attributes" do
      it "doesn't save into the database" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete #destroy" do
    it "locates the correct/requested user" do
      delete :destroy, id: @user
      expect(assigns[:user]).to eq(@user)
    end
    it "validates that the user's id is the same as the logged in user" do
      delete :destroy, id: @user
      expect(session[:user_id]).to eq(@user.id)
    end
    it "removes user from database" do
      expect{ delete :destroy, id: @user }.to change(User, :count).by(-1)
    end
    it "redirects to root_path" do
      delete :destroy, id: @user
      expect(response).to redirect_to(root_path)
    end
  end

end
