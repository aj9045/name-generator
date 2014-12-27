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
    context "valid attributes" do
      it "saves user into database" do
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
      end

      it "redirects to root" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end

      it "sets session for that user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(session[:user_id]).to_not be_nil
      end
    end
    context "invalid attributes" do
      it "should not save into the database" do
        expect { post :create, user: FactoryGirl.attributes_for(:invalid_user) }.to_not change(User, :count)
      end
      it "should re-render :new template" do
        post :create, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put #update" do
    context "valid attributes" do
      it "should locate correct/requested user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, username: "updated")
        expect(assigns[:user]).to eq(@user)
      end
      it "should update attributes for correct/requested user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, username: "updated")
        expect(@user.username).to eq("updated")
      end
      it "shout redirect to user profile" do
        puts :update, id: @user, user: FactoryGirl.attributes_for(:user, username: "updated")
        @user.reload
        expect(response).to redirect_to(user_path(@user))
      end
    end
    context "invalid attributes" do
      it "should not save into the database" do
        puts :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete #destroy" do
    it "should locate the correct/requested user" do
      delete :destroy, id: @user
      expect(assigns[:user]).to eq(@user)
    end
    it "should validate that the user's id is the same as the logged in user" do
      delete :destroy, id: @user
      expect(session[:user_id]).to eq(@user.id)
    end
    it "should remove user from database" do
      expect { delete :destroy, id: @user }.to change(User, :count).by(-1)
    end
    it "should redirect to root_path" do
      delete :destroy, id: @user
      expect(response).to redirect_to(root_path)
    end
  end

end
