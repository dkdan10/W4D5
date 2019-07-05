require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

describe "get#new" do
  it 'renders a new template' do
    allow(subject).to receive(:logged_in?).and_return(true)
    get(:new)
    expect(response).to render_template(:new)
  end
end

describe "post#create" do

  let(:valid_params) { { user: { username: "FatherFaucet", password: "!staten_Pete_DOPE_davidson_at_xxxislandsxxx_dot_com_just_for_fun!" } } }
  let(:invalid_params) { { user: { nsadaame: "" } } }

    context "when this user valid with the params" do
      before(:each) do
        post("create", params: valid_params)
        allow(subject).to receive(:current_user).and_return(User.last)
      end
      it 'create a user dawg' do 
        expect(User.last.username).to eq("FatherFaucet")
      end

      it 'log a user in dawg' do
        expect(User.last.session_token).to eq(session[:session_token])
      end

      it 'redirects to goals page' do
        expect(response).to redirect_to(goals_url)
      end
    end

    context "when this user invalid with the params. yah feel. hella invalid" do
      before(:each) do
        post("create", params: invalid_params)
        allow(subject).to receive(:current_user).and_return(User.last)
      end

      it 'thows errors dawg' do 
        expect(flash[:errors].nil?).to be(false)
      end

      it 'renders signup again' do
        expect(response).to render_template(:new)
      end
    end
  end
  
end
