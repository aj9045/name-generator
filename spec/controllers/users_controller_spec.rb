require "rails_helper"

describe UsersController do

  describe "the Get routes" do
    describe "Get #show" do
      it "locates the correct/requested user" do
        get :show, id: @user
      end

      it "renders :show template" do
      end
    end

    describe "Get #edit" do
      it "locates the correct/requested user" do
      end

      it "renders :edit template (with update form)" do
      end
    end

    describe "Get #new" do
      it "assigns a new user" do
      end

      it "renders :new template (with create form)" do
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
