feature 'user can sign up' do
  scenario 'user can fill in sign up form' do
    visit('/')
    fill_in :email, with: 'test@email.com'
    fill_in :password, with: '123456'
    click_button('Sign up')
    expect(page.current_url).to include('/links')
    expect(page).to have_content 'Welcome, test@email.com'
    expect(User.all.length).to eq 1
  end
end