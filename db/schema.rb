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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150730105548) do

  create_table "account_documents", force: true do |t|
    t.date     "payment_date"
    t.integer  "value"
    t.integer  "payment_group_id"
    t.string   "physical_factor_number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "factor_type"
    t.boolean  "status",                    default: false
    t.integer  "takhfif_precent"
    t.string   "takhfif_title"
    t.integer  "takhfif_amount"
    t.string   "installation_cost_title"
    t.integer  "installation_cost_precent"
    t.integer  "installation_cost"
    t.string   "tavajoh"
    t.string   "paid_by"
    t.string   "paid_to"
    t.string   "factor_number"
    t.string   "scan_file_file_name"
    t.string   "scan_file_content_type"
    t.integer  "scan_file_file_size"
    t.datetime "scan_file_updated_at"
    t.integer  "primary_value"
  end

  create_table "camera_models", force: true do |t|
    t.integer  "subservice_id"
    t.string   "title_en"
    t.string   "title_fa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description_en"
    t.string   "description_fa"
  end

  create_table "contacts", force: true do |t|
    t.string   "preson_name"
    t.string   "company_name"
    t.string   "phone"
    t.string   "fax"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "title"
    t.date     "contract_start_date"
    t.date     "contract_end_date"
    t.text     "description"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_title"
  end

  create_table "design_samples", force: true do |t|
    t.string   "name"
    t.text     "website"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "type"
  end

  create_table "factor_details", force: true do |t|
    t.string   "object_name"
    t.integer  "objecct_price"
    t.integer  "object_amount"
    t.integer  "account_document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of"
  end

  create_table "letters", force: true do |t|
    t.string   "letter_number"
    t.string   "peyvast"
    t.string   "reciever_name"
    t.string   "reciever_post"
    t.string   "letter_subject"
    t.text     "text"
    t.string   "sign_thanks"
    t.string   "sign_post"
    t.text     "runevesht"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "copy"
  end

  create_table "order_onlines", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "company_name"
    t.string   "web_site"
    t.string   "mobile"
    t.text     "text_msg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.text     "text_fa"
    t.text     "text_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "payment_groups", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "account_document_id"
    t.integer  "payment_amount"
    t.integer  "payment_type"
    t.date     "payment_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "portfolios", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "description_en"
    t.string   "description_fa"
    t.date     "date"
    t.integer  "service_id"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "in_production"
  end

  create_table "related_people", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "description_en"
    t.string   "description_fa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "skills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "team_id"
  end

  create_table "submenus", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subservice_id"
  end

  create_table "subservices", force: true do |t|
    t.text     "text_fa"
    t.text     "text_en"
    t.string   "title_en"
    t.string   "title_fa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "service_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "tariff_orders", force: true do |t|
    t.integer  "modual_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_online_id"
    t.integer  "tariff_price_id"
  end

  create_table "tariff_prices", force: true do |t|
    t.text     "modual"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.boolean  "set_number", default: false
    t.integer  "price_unit"
    t.string   "modual_en"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description_en"
    t.text     "description_fa"
    t.integer  "set_order"
    t.text     "education"
    t.text     "job_field"
    t.text     "ability"
    t.text     "contact_info"
    t.text     "education_en"
    t.text     "job_field_en"
    t.text     "ability_en"
    t.text     "contact_info_en"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
