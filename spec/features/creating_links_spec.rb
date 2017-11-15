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
    visit '/create_link'
    fill_in :link_name, with: 'Google'
    fill_in :link_url, with: 'www.google.co.uk'
    fill_in :link_tag, with: 'search'
    click_button 'Add Link'

    visit '/create_link'
    fill_in :link_name, with: 'yahoo'
    fill_in :link_url, with: 'www.yahoo.co.uk'
    fill_in :link_tag, with: 'search'
    click_button 'Add Link'

    # p Tag.all(name: 'search').links
    last_tag = Link.last.tags.last
    expect(last_tag.name).to eq('search')
    expect(page).to have_content('Google')
  end
end
