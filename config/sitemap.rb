# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.bubboli.com"
SitemapGenerator::Sitemap.sitemaps_host = ENV['SITEMAP_HOST']
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new


SitemapGenerator::Sitemap.create do
  add '/gifts', :changefreq => 'daily', :priority => 1.0
  add '/about', :changefreq => 'weekly'
  add '/gifts/favorite', :changefreq => 'daily'
  add '/gifts/baby_shower', :changefreq => 'weekly'
  add '/blog', :changefreq => 'weekly'
    Blog.find_each do |blog|
      add blog_path(blog), lastmod: blog.updated_at
    end
    
    Gift.find_each do |gift|
      add gift_path(gift), lastmod: gift.updated_at
    end
  
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

SitemapGenerator::Sitemap.ping_search_engines