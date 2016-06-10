require 'rails_helper'

describe BlogsController do
  describe "GET #index" do
    it "lists all the blogs from the database" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "renders new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do
    it "opens a blog show page" do
      blog = create(:blog)
      get :show, id: blog
      expect(response).to render_template("show")
    end
    it "allows user to add comments"
    it "allows user to view existing comments"
  end

  describe "POST #create" do
    it "allows user to create a new blog"
    it "redirects to the blog's show page" do
      blog = create(:blog)
      get :show, id: blog
      expect(response).to render_template("show")
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @blog = create(:blog)
    end

    it "allows user to destroy his own blog" do
      expect{ delete :destroy,  id: @blog}.to change(Blog, :count).by(-1)
    end
  end
end
