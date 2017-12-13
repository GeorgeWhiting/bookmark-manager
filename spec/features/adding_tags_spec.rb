feature 'Adding tags' do
  scenario "user can tag their submitted bookmarks" do
    visit '/links/new'
    fill_in('addlink', with: 'https://www.tednewton.com')
    fill_in('link_name', with: 'Teds shit website')
    fill_in('tag', with: 'memes')
    click_button('Add')
    link = Link.first
    p link.tags
    expect(link.tags.map(&:name)).to include('memes')
  end
end
