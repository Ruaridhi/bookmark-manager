require 'pg'

# this class holds static bookmarks
class Bookmark
  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    list = connection.exec 'SELECT * FROM bookmarks'
    list.map { |bookmark| bookmark['url'] }
  end
end