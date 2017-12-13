feature 'Adding links' do
  scenario "user can submit a new link to add it to bookmarks" do
    visit '/links/new'
    fill_in('addlink', with: 'https://www.tednewton.com')
    fill_in('link_name', with: 'Teds shit website')
    click_button('Add')
    expect(page).to have_content('https://www.tednewton.com')
    expect(page).to have_content('Teds shit website')
  end

  scenario "user can tag their submitted bookmarks" do
    visit '/links/new'
    fill_in('addlink', with: 'https://www.tednewton.com')
    fill_in('link_name', with: 'Teds shit website')
    fill_in('tag', with: 'memes')
    click_button('Add')
    link = Link.first
    expect(link.tag.map(&:name)).to include('memes')
  end
end
