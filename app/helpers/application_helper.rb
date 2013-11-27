module ApplicationHelper

  def bubboli
    bubboli = image_tag("BubboliLogo.png", :alt => "Bubboli")
  end
  
  def elephant
    elephant = image_tag("elephant.jpg", :alt => "Bubboli")
  end

  def facebook
    facebook = image_tag("facebook.jpg", :alt => "Bubboli Facebook")
  end
  
  def twitter
    twitter = image_tag("twitter.jpg", :alt => "Bubboli Twitter")
  end

  def gmail
    gmail = image_tag("gmail.jpg", :alt => "Gmail")
  end
  
  def rss
    rss = image_tag("rss.jpg", :alt => "Bubboli RSS")
  end

  def pinterest
    pinterest = image_tag("pinterest.jpg", :alt => "Bubboli Pinterest")
  end

  def bubboli_team
    bubboli_team = image_tag("BubboliTeam.gif", :alt => "Bubboli Team")
  end

  def splash_one
    splash_one = image_tag("baby_smiling.jpg", :alt => "splash one", :class => "active")
  end

  def splash_two
    splash_two = image_tag("babies_w_toys.jpg", :alt => "splash two")
  end

  def blog
    blog = image_tag("bubboli-blog.jpg", :alt => "bubboli blog")
  end

  def separator
    separator = image_tag("separator.png", :alt => "")
  end
  
  def add_a_child
    add_a_child = image_tag("add-a-child.jpg", :alt => "Add a child")
  end
  
  def send_recommendation
    send_recommendation = image_tag("send-recommendation.jpg", :alt => "Send Recommendation")
  end
  
  def hugs_and_kisses
    hugs_and_kisses = image_tag("hugs-and-kisses.jpg", :alt => "Hugs and kisses")
  end
  
  def get_gifts
    get_gifts = image_tag("gift.jpg", :alt => "Receive presents")
  end
  
  def get_organized
    get_organized = image_tag("organized.jpg", :alt => "Get organized")
  end
  
  def welcome
    welcome = image_tag("welcome.png", :alt => "Bubboli Welcome")
  end
  
  def error_page
    error_page = image_tag("BubboliErrorPage.png", :alt => "404 Error")
  end
  
  def five_hundred_error
    five_hundred_error = image_tag("Bubboli500Error.png", :alt => "500 Error")
  end
  
  def buy_from_amazon
    buy_from_amazon = image_tag("buy_amazon.gif", :alt => "Buy From Amazon")
  end
  
  def check_email
    check_email = image_tag("email.jpg", :alt => "Check Email")
  end
  
  def pic_one
    pic_one = image_tag("superhero_girl.jpg", :alt => "superhero_girl")
  end
  
  def pic_two
    pic_two = image_tag("grandparents_with_grandkids.jpg", :alt => "grandparents with grandkids")
  end
  
  def pic_three
    pic_three = image_tag("birthday_cupcakes.jpg", :alt => "birthday cupcakes")
  end
  
  def bubboli_mission
    mission = image_tag("bubboli-mission.jpg", :alt => "The Bubboli Mision: To play a small role in bridging the distance
    - emotionally and physically - between you and your special bubbies, whether you are around the corner, in a different
    state or a different country.  We search all the nooks and crannies to find the best gifts for your special bubbie so ")
  end

  def twitterized_type(type)
    case type
      when :alert
        "alert-block"
      when :error
        "alert-error"
      when :notice
        "alert-info"
      when :success
        "alert-success"
      else
        type.to_s
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
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
