 # Capybara.app = Bookmark
  feature 'creating links' do
    scenario 'user can input a new link' do
      visit '/create_link'
      expect(page).to have_field('link_name')
      expect(page).to have_field('link_url')
      expect(page).to have_field('link_tag')
      expect(page).to have_selector('input', id: 'save')
  end

  scenario 'link is added' do
    create_link('Google', 'www.google.co.uk', 'search')
    create_link('Yahoo', 'www.yahoo.co.uk', 'search')
    last_tag = Link.last.tags.last
    expect(last_tag.name).to eq('search')
    expect(page).to have_content('Google')
  end
end
