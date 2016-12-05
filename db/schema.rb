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

ActiveRecord::Schema.define(version: 20161204134947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bom_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "description"
  end

  create_table "boms", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "bom_category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "purchase_order_number"
    t.index ["bom_category_id"], name: "index_boms_on_bom_category_id", using: :btree
  end

  create_table "firmwares", force: :cascade do |t|
    t.string   "number"
    t.text     "description"
    t.datetime "publish_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "multi_questions", force: :cascade do |t|
    t.string   "text_answer"
    t.boolean  "selected"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_multi_questions_on_question_id", using: :btree
  end

  create_table "multiple_questions", force: :cascade do |t|
    t.string   "question_text"
    t.boolean  "checked"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["questionnaire_id"], name: "index_multiple_questions_on_questionnaire_id", using: :btree
  end

  create_table "part_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "part_modules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "count"
    t.integer  "bom_id"
    t.index ["bom_id"], name: "index_part_modules_on_bom_id", using: :btree
  end

  create_table "parts", force: :cascade do |t|
    t.string   "part_name"
    t.text     "part_description"
    t.string   "manufacturing_part"
    t.string   "number"
    t.string   "darko_part_number"
    t.string   "price"
    t.integer  "firmware_id"
    t.integer  "part_category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "specification_file_name"
    t.string   "specification_content_type"
    t.integer  "specification_file_size"
    t.datetime "specification_updated_at"
    t.integer  "part_module_id"
    t.index ["firmware_id"], name: "index_parts_on_firmware_id", using: :btree
    t.index ["part_category_id"], name: "index_parts_on_part_category_id", using: :btree
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "type"
    t.string   "text_question"
    t.string   "text_question_answer"
    t.string   "select_question"
    t.boolean  "select_question_answer"
    t.string   "multiple_question"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "bom_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.integer  "type"
    t.string   "text_answer"
    t.boolean  "choice_answer"
    t.integer  "bom_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["bom_id"], name: "index_questions_on_bom_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "boms", "bom_categories"
  add_foreign_key "multi_questions", "questions"
  add_foreign_key "multiple_questions", "questionnaires"
  add_foreign_key "part_modules", "boms"
  add_foreign_key "parts", "firmwares"
  add_foreign_key "parts", "part_categories"
  add_foreign_key "questions", "boms"
end
