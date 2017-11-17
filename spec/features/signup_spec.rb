feature 'user can sign up' do
  scenario 'user can fill in sign up form' do
    expect { complete_sign_up_form }.to change { User.all.length }.by(1)
    expect(page.current_url).to include('/links')
    expect(page).to have_content 'Welcome, test@email.com'
  end

  scenario 'user unable to sign up with mismatching password confirmation' do
    expect { sign_in_with_wrong_password }.not_to change { User.all.length }
    expect(page).to have_content('Error: Passwords did not match')
  end
end
