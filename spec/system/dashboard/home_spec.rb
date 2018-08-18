require "rails_helper"

describe "Dashboard::Home" do
  it "can sign up" do
    email = "serey@bongloy.com"
    password = "12345678"

    visit dashboard_root_path

    expect(current_path).to eq(new_user_session_path)

    click_link("Sign up")

    fill_in("Email", with: email)
    fill_in("Password", with: password, match: :prefer_exact)
    fill_in("Password confirmation", with: password, match: :prefer_exact)
    click_button("Sign up")

    within("#flash") do
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end
end
