require 'xz'
require 'xmlsimple'

def news_clean
  News.delete_all
end

def xzread(file)
  XZ.decompress(File.open(file).read)
end

def news_get
  XmlSimple.xml_in xzread 'db/old_news.xml.xz'
end

def news_load
  news_data = news_get

  root_user = User.find :first, :conditions => { :username => 'root' }
  news_data['node_revisions'].reverse.each do |row|
    n = News.new(:title => row['title'][0], :text => row['body'][0])
    n.user = root_user
    n.save
  end
  true
end
