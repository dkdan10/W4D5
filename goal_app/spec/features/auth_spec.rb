require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  before(:each) do 
    create(:user)
    log_in_user(User.last)
  end

  scenario 'has a signup page' 


  feature 'signing up a user' do

    scenario 'shows username on the homepage after a signup'
  
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'
end