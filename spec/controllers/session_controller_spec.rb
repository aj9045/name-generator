require 'rails_helper'

describe SessionController, type: :controller do
  describe "Get #new" do
    it "should render login" do
      get :new
      expect(response).to render_template(:login)
    end
  end

  describe "Post #login" do
    before do
      @user = FactoryGirl.create(:user)
    end
    it "should set session with user id" do
      session[:user_id] = @user.id
      post :login, user: FactoryGirl.attributes_for(:user, username: @user.username)
      expect(session[:user_id]).to eq(@user.id)
    end
    it "should redirect to root_path" do
      post :login, user: FactoryGirl.attributes_for(:user, username: @user.username)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "Delete #logout" do
    it "should set session[:user_id] back to nil" do
      delete :logout
      expect(session[:user_id]).to be_nil
    end
  end
end