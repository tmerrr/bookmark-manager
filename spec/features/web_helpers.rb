def create_link(name, url, tag)
  visit '/links/new'
  fill_in :link_name, with: name
  fill_in :link_url, with: url
  fill_in :link_tag, with: tag
  click_button 'Add Link'
end

def complete_sign_up_form
  visit('/')
  fill_in(:email, with: 'test@email.com')
  fill_in(:password, with: '12345')
  fill_in(:password_confirmation, with: '12345')
  click_button('Sign up')
end

def sign_in_with_wrong_password
  visit('/')
  fill_in(:email, with: 'test@email.com')
  fill_in(:password, with: '12345')
  fill_in(:password_confirmation, with: '67890')
  click_button('Sign up')
end
