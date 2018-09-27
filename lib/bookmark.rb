require 'pg'

# this class holds static bookmarks
class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    list = connection.exec 'SELECT * FROM bookmarks'
    list.map { |bookmark| bookmark['url'] }
  end
end
