feature 'Adding tags' do
  scenario "user can tag their submitted bookmarks" do
    visit '/links/new'
    fill_in('addlink', with: 'https://www.tednewton.com')
    fill_in('link_name', with: 'Teds shit website')
    fill_in('tag', with: 'memes')
    click_button('Add')
    link = Link.first
    expect(link.tags.map(&:name)).to include('memes')
  end

  scenario "user can add multiple tags" do
    visit '/links/new'
    fill_in('addlink', with: 'https://www.tednewton.com')
    fill_in('link_name', with: 'Teds shit website')
    fill_in('tag', with: 'memes, ted')
    click_button('Add')
    link = Link.first
    expect(link.tags.map(&:name)).to include('memes', 'ted')
  end
end
