require 'spec_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up for an account"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'email', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "Submit"
    end

    scenario "redirects to user's show page after signup" do
      expect(page).to have_content "testing@email.com"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'email', :with => "testing@email.com"
      click_on "Submit"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(page).to have_content "Sign up for an account"
    end
  end

end
