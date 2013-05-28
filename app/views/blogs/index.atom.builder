atom_feed do |feed|
  feed.title "Bubboli Blog"
  feed.updated @blogs.maximum(:updated_at)
  
  @blogs.each do |blog|
    feed.entry blog, published: blog.publish_date do |entry|
      entry.title blog.title
      entry.content blog.content
      entry.author do |author|
        author.name blog.author
      end
    end
  end
end
