# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121228185739) do

  create_table "blog_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blog_categorizations", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "blog_category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "blog_categorizations", ["blog_id", "blog_category_id"], :name => "index_blog_categorizations_on_blog_id_and_blog_category_id"

  create_table "blog_images", :force => true do |t|
    t.integer  "blog_id"
    t.string   "image",      :null => false
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blog_images", ["blog_id"], :name => "index_blog_images_on_blog_id"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "published",        :default => false
    t.string   "author"
    t.string   "author_permalink"
    t.datetime "publish_date"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "child_images", :force => true do |t|
    t.integer  "child_id"
    t.string   "image"
    t.boolean  "profile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "child_images", ["child_id"], :name => "index_child_images_on_child_id"

  create_table "children", :force => true do |t|
    t.string   "first_name"
    t.date     "birth_date"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "blog_id"
    t.text     "content"
    t.string   "commenter"
    t.string   "commenter_email"
    t.string   "commenter_permalink"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "comments", ["blog_id"], :name => "index_comments_on_blog_id"

  create_table "gift_accessions", :force => true do |t|
    t.integer  "gift_id"
    t.integer  "child_id"
    t.integer  "user_id"
    t.boolean  "approved",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "gift_accessions", ["child_id"], :name => "index_gift_accessions_on_child_id"
  add_index "gift_accessions", ["user_id"], :name => "index_gift_accessions_on_user_id"

  create_table "gift_age_classifications", :force => true do |t|
    t.integer  "gift_id"
    t.integer  "gift_age_range_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "gift_age_classifications", ["gift_id", "gift_age_range_id"], :name => "index_gift_age_classifications_on_gift_id_and_gift_age_range_id"

  create_table "gift_age_ranges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gift_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gift_categorizations", :force => true do |t|
    t.integer  "gift_id"
    t.integer  "gift_category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "gift_categorizations", ["gift_id", "gift_category_id"], :name => "index_gift_categorizations_on_gift_id_and_gift_category_id"

  create_table "gift_images", :force => true do |t|
    t.integer  "gift_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "gift_images", ["gift_id"], :name => "index_gift_images_on_gift_id"

  create_table "gift_price_classifications", :force => true do |t|
    t.integer  "gift_id"
    t.integer  "gift_price_range_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "gift_price_classifications", ["gift_id", "gift_price_range_id"], :name => "gift_price_classification"
  add_index "gift_price_classifications", ["gift_id"], :name => "index_gift_price_classifications_on_gift_id"
  add_index "gift_price_classifications", ["gift_price_range_id"], :name => "index_gift_price_classifications_on_gift_price_range_id"

  create_table "gift_price_ranges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gifts", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.boolean  "available",                                          :default => false
    t.string   "sku"
    t.string   "manufacturer"
    t.decimal  "price",                :precision => 5, :scale => 2
    t.string   "merchant"
    t.string   "gender"
    t.text     "description"
    t.text     "review"
    t.text     "why_bubboli_loves_it"
    t.boolean  "favorite"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
  end

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "child_id"
    t.string   "recipient_email"
    t.string   "invitation_token"
    t.datetime "sent_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "invitations", ["child_id"], :name => "index_invitations_on_child_id"
  add_index "invitations", ["sender_id", "child_id"], :name => "index_invitations_on_sender_id_and_child_id"
  add_index "invitations", ["sender_id"], :name => "index_invitations_on_sender_id"

  create_table "relation_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "child_id"
    t.integer  "relation_type_id"
    t.string   "status",           :default => "Pending"
    t.datetime "accepted_at"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "relationships", ["child_id"], :name => "index_relationships_on_child_id"
  add_index "relationships", ["relation_type_id"], :name => "index_relationships_on_relation_type_id"
  add_index "relationships", ["user_id", "child_id", "relation_type_id"], :name => "index_relationships_on_user_id_and_child_id_and_relation_type_id"
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "user_child_cat_prefs", :force => true do |t|
    t.integer  "relationship_id"
    t.integer  "gift_category_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "user_child_cat_prefs", ["gift_category_id"], :name => "index_user_child_cat_prefs_on_gift_category_id"
  add_index "user_child_cat_prefs", ["relationship_id", "gift_category_id"], :name => "user_child_cat_pref"
  add_index "user_child_cat_prefs", ["relationship_id"], :name => "index_user_child_cat_prefs_on_relationship_id"

  create_table "user_child_price_prefs", :force => true do |t|
    t.integer  "relationship_id"
    t.integer  "gift_price_range_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "user_child_price_prefs", ["gift_price_range_id"], :name => "index_user_child_price_prefs_on_gift_price_range_id"
  add_index "user_child_price_prefs", ["relationship_id", "gift_price_range_id"], :name => "user_child_price_pref"
  add_index "user_child_price_prefs", ["relationship_id"], :name => "index_user_child_price_prefs_on_relationship_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",                 :limit => 25
    t.string   "last_name",                  :limit => 50
    t.string   "email"
    t.string   "work_email"
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_token_sent_at"
    t.boolean  "confirmed",                                :default => false, :null => false
    t.string   "gender"
    t.string   "address_street"
    t.string   "address_apt"
    t.string   "address_city"
    t.string   "address_state"
    t.integer  "address_zip"
    t.string   "address_country"
    t.boolean  "admin",                                    :default => false
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "invitation_id"
  end

  add_index "users", ["email", "work_email"], :name => "index_users_on_email_and_work_email", :unique => true

end
