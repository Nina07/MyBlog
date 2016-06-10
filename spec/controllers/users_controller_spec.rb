require 'rails_helper'

describe UsersController do
  describe "GET #new" do
    it "opens page for new user to register"
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it "renders view :new" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the data from form into database."
      it "redirects to login page then"
    end

    context "with invalid attributes" do
      it "doesn't save the form entry"
      it "renders :new template" do
        get :new
        expect(response).to render_template("new")
      end
      it "outputs the errors encountered while trying to save the invalid entry"
    end
  end
end
