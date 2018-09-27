require 'bookmark'
require_relative './setup_test_database'
require 'pg'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  connection = PG.connect(dbname: 'bookmark_manager_test')
  describe '.all' do
    it 'returns all bookmarks' do
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      # expect(bookmarks).to include('http://www.google.com')
    end
  end
end
