def create_link(name, url, tag)
  visit '/create_link'
  fill_in :link_name, with: name
  fill_in :link_url, with: url
  fill_in :link_tag, with: tag
  click_button 'Add Link'
end