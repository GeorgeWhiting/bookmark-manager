feature 'Searching links by tags' do
  scenario 'user can filter their links by tag' do
    sign_up
    Link.create(url: 'http://www.tednewton.com', title: 'Teds shit website', tags: [Tag.first_or_create(name: 'memes')])
    Link.create(url: 'http://www.georgewhiting.com', title: 'Georges equally shit website', tags: [Tag.first_or_create(name: 'memes')])
    Link.create(url: 'http://www.amazon.com', title: 'Some book shop', tags: [Tag.first_or_create(name: 'books')])
    Link.create(url: 'http://www.quidditchuk.org', title: 'Give me ref payment pls', tags: [Tag.first_or_create(name: 'ashara')])
    visit '/tags/memes'
    expect(page.status_code).to eq 200

    within 'ul#links' do
    expect(page).to have_content('Teds shit website')
    expect(page).to have_content('Georges equally shit website')
    expect(page).to_not have_content('Give me red payment pls')
    expect(page).to_not have_content('Some book shop')
    end
  end
end
