module ApplicationHelper

  def bubboli
    bubboli = image_tag("BubboliLogo.png", :att => "Bubboli")
  end

  def facebook
    facebook = image_tag("facebook.jpg", :att => "Facebook")
  end
  
  def twitter
    twitter = image_tag("twitter.jpg", :att => "Twitter")
  end

  def gmail
    gmail = image_tag("gmail.jpg", :att => "Gmail")
  end
  
  def rss
    rss = image_tag("rss.jpg", :att => "RSS")
  end

  def pinterest
    pinterest = image_tag("pinterest.jpg", :att => "Pinterest")
  end

  def bubboli_team
    bubboli_team = image_tag("BubboliTeam.gif", :att => "Bubboli Team")
  end

  def splash_one
    splash_one = image_tag("baby_smiling.jpg", :att => "splash one", :class => "active")
  end

  def splash_two
    splash_two = image_tag("babies_w_toys.jpg", :att => "splash two")
  end

  def blog
    blog = image_tag("bubboli-blog.jpg", :att => "blog")
  end

  def twitterized_type(type)
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        type.to_s
    end
  end

  
  
  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end

  def page_navigation_links(pages, anchor)
    will_paginate(pages, :params => {:anchor => anchor }, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end

end
