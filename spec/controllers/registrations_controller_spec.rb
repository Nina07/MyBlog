require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe "GET #after_sign_up_path_for" do
    it "returns http success" do
      get :after_sign_up_path_for
      expect(response).to have_http_status(:success)
    end
  end

end
