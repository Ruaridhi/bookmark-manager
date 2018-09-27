feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Adding bookmark' do
  scenario 'user is able to add a bookmark'do
    visit('/')
    fill_in('add_bookmark', with: 'www.imawebsite.com')
    click_button('Submit')
    visit('/bookmarks')
    expect(page).to have_content('www.imawebsite.com')
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
    # expect(page).to have_content 'http://www.destroyallsoftware.com'
    # expect(page).to have_content 'http://www.google.com'
  end
end
