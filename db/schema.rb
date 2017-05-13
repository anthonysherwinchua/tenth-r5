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

ActiveRecord::Schema.define(version: 20170510122055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_degrees", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_academic_degrees_on_name", using: :btree
  end

  create_table "academic_levels", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_academic_levels_on_name", using: :btree
  end

  create_table "applicant_contact_details", force: :cascade do |t|
    t.integer "applicant_id",    default: 0
    t.integer "contact_type_id", default: 0
    t.string  "value",           default: ""
    t.index ["applicant_id"], name: "index_applicant_contact_details_on_applicant_id", using: :btree
    t.index ["contact_type_id"], name: "index_applicant_contact_details_on_contact_type_id", using: :btree
  end

  create_table "applicant_documents", force: :cascade do |t|
    t.integer  "applicant_id",      default: 0
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.datetime "file_updated_at"
    t.index ["applicant_id"], name: "index_applicant_documents_on_applicant_id", using: :btree
    t.index ["file_content_type"], name: "index_applicant_documents_on_file_content_type", using: :btree
    t.index ["file_file_name"], name: "index_applicant_documents_on_file_file_name", using: :btree
    t.index ["file_file_size"], name: "index_applicant_documents_on_file_file_size", using: :btree
    t.index ["file_updated_at"], name: "index_applicant_documents_on_file_updated_at", using: :btree
  end

  create_table "applicant_educations", force: :cascade do |t|
    t.integer "applicant_id",      default: 0
    t.string  "school",            default: ""
    t.integer "academic_level_id", default: 0
    t.string  "academic_degree",   default: ""
    t.integer "from"
    t.integer "to"
    t.index ["applicant_id"], name: "index_applicant_educations_on_applicant_id", using: :btree
  end

  create_table "applicant_employments", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.string  "occupation",   default: ""
    t.string  "country",      default: ""
    t.string  "employer",     default: ""
    t.string  "from",         default: "1990"
    t.string  "to",           default: "1990"
    t.integer "years"
    t.string  "address",      default: ""
    t.string  "contact",      default: ""
    t.string  "salary",       default: ""
    t.index ["applicant_id"], name: "index_applicant_employments_on_applicant_id", using: :btree
  end

  create_table "applicant_family_details", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "sisters"
    t.integer "brothers"
    t.integer "no_in_fam"
    t.integer "eldest"
    t.integer "youngest"
    t.integer "children"
    t.index ["applicant_id"], name: "index_applicant_family_details_on_applicant_id", using: :btree
  end

  create_table "applicant_family_members", force: :cascade do |t|
    t.integer "applicant_id",    default: 0
    t.string  "occupation",      default: ""
    t.integer "relationship_id", default: 0
    t.string  "name",            default: ""
    t.string  "salary",          default: ""
    t.integer "age"
    t.index ["applicant_id"], name: "index_applicant_family_members_on_applicant_id", using: :btree
    t.index ["relationship_id"], name: "index_applicant_family_members_on_relationship_id", using: :btree
  end

  create_table "applicant_languages", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "language_id",  default: 0
    t.boolean "read"
    t.boolean "write"
    t.boolean "speak"
    t.index ["applicant_id"], name: "index_applicant_languages_on_applicant_id", using: :btree
    t.index ["language_id"], name: "index_applicant_languages_on_language_id", using: :btree
  end

  create_table "applicant_meta_data", force: :cascade do |t|
    t.integer "applicant_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "applicant_photos", force: :cascade do |t|
    t.integer  "applicant_id",           default: 0
    t.string   "mug_shot_file_name"
    t.string   "mug_shot_content_type"
    t.string   "mug_shot_file_size"
    t.datetime "mug_shot_updated_at"
    t.string   "full_body_file_name"
    t.string   "full_body_content_type"
    t.string   "full_body_file_size"
    t.datetime "full_body_updated_at"
    t.integer  "crop_mug_shot_x"
    t.integer  "crop_mug_shot_y"
    t.integer  "crop_mug_shot_w"
    t.integer  "crop_mug_shot_h"
    t.integer  "crop_full_body_x"
    t.integer  "crop_full_body_y"
    t.integer  "crop_full_body_w"
    t.integer  "crop_full_body_h"
    t.index ["applicant_id"], name: "index_applicant_photos_on_applicant_id", using: :btree
    t.index ["full_body_content_type"], name: "index_applicant_photos_on_full_body_content_type", using: :btree
    t.index ["full_body_file_name"], name: "index_applicant_photos_on_full_body_file_name", using: :btree
    t.index ["full_body_file_size"], name: "index_applicant_photos_on_full_body_file_size", using: :btree
    t.index ["full_body_updated_at"], name: "index_applicant_photos_on_full_body_updated_at", using: :btree
    t.index ["mug_shot_content_type"], name: "index_applicant_photos_on_mug_shot_content_type", using: :btree
    t.index ["mug_shot_file_name"], name: "index_applicant_photos_on_mug_shot_file_name", using: :btree
    t.index ["mug_shot_file_size"], name: "index_applicant_photos_on_mug_shot_file_size", using: :btree
    t.index ["mug_shot_updated_at"], name: "index_applicant_photos_on_mug_shot_updated_at", using: :btree
  end

  create_table "applicant_requirements", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "document_id",  default: 0
    t.date    "apply"
    t.date    "arrive"
    t.date    "expire"
    t.string  "note",         default: ""
    t.index ["applicant_id"], name: "index_applicant_requirements_on_applicant_id", using: :btree
    t.index ["document_id"], name: "index_applicant_requirements_on_document_id", using: :btree
    t.index ["document_id"], name: "index_applicant_requirements_on_requirement_id", using: :btree
  end

  create_table "applicant_skills", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "skill_id",     default: 0
    t.index ["applicant_id"], name: "index_applicant_skills_on_applicant_id", using: :btree
    t.index ["skill_id"], name: "index_applicant_skills_on_skill_id", using: :btree
  end

  create_table "applicants", force: :cascade do |t|
    t.integer "religion_id",     default: 0
    t.integer "citizenship_id",  default: 0
    t.integer "civil_status_id", default: 0
    t.string  "first_name",      default: ""
    t.string  "last_name",       default: ""
    t.string  "middle_name",     default: ""
    t.string  "suffix_name",     default: ""
    t.date    "birthday"
    t.string  "birthplace",      default: ""
    t.boolean "gender",          default: true
    t.string  "height"
    t.string  "weight"
    t.string  "video_url",       default: ""
    t.index ["birthday"], name: "index_applicants_on_birthday", using: :btree
    t.index ["birthplace"], name: "index_applicants_on_birthplace", using: :btree
    t.index ["citizenship_id"], name: "index_applicants_on_citizenship_id", using: :btree
    t.index ["civil_status_id"], name: "index_applicants_on_civil_status_id", using: :btree
    t.index ["first_name"], name: "index_applicants_on_first_name", using: :btree
    t.index ["gender"], name: "index_applicants_on_gender", using: :btree
    t.index ["height"], name: "index_applicants_on_height", using: :btree
    t.index ["last_name"], name: "index_applicants_on_last_name", using: :btree
    t.index ["middle_name"], name: "index_applicants_on_middle_name", using: :btree
    t.index ["religion_id"], name: "index_applicants_on_religion_id", using: :btree
    t.index ["suffix_name"], name: "index_applicants_on_suffix_name", using: :btree
    t.index ["weight"], name: "index_applicants_on_weight", using: :btree
  end

  create_table "applications", force: :cascade do |t|
    t.integer "applicant_id",   default: 0
    t.integer "job_opening_id", default: 0
    t.date    "date_applied"
    t.date    "availability"
    t.string  "applicant_code", default: ""
    t.boolean "available",      default: false
    t.index ["applicant_id"], name: "index_applications_on_applicant_id", using: :btree
    t.index ["job_opening_id"], name: "index_applications_on_job_opening_id", using: :btree
  end

  create_table "band_profiles", force: :cascade do |t|
    t.integer  "band_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["band_id"], name: "index_band_profiles_on_band_id", using: :btree
  end

  create_table "band_repertoires", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "band_id"
    t.index ["band_id"], name: "index_band_repertoires_on_band_id", using: :btree
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.boolean  "published",                default: false
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.string   "youtube_link",             default: ""
    t.date     "available_date"
  end

  create_table "blood_types", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_blood_types_on_name", using: :btree
  end

  create_table "citizenships", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_citizenships_on_name", using: :btree
  end

  create_table "civil_statuses", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_civil_statuses_on_name", using: :btree
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_contact_types_on_name", using: :btree
  end

  create_table "contact_us_messages", force: :cascade do |t|
    t.string   "name",       default: ""
    t.string   "email",      default: ""
    t.string   "subject",    default: ""
    t.text     "message"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string  "iso",            default: ""
    t.string  "name",           default: ""
    t.string  "printable_name", default: ""
    t.string  "iso3",           default: ""
    t.integer "numcode",        default: 0
    t.boolean "enabled",        default: false
    t.index ["iso"], name: "index_countries_on_iso", using: :btree
    t.index ["iso3"], name: "index_countries_on_iso3", using: :btree
    t.index ["name"], name: "index_countries_on_name", using: :btree
    t.index ["numcode"], name: "index_countries_on_numcode", using: :btree
    t.index ["printable_name"], name: "index_countries_on_printable_name", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_documents_on_name", using: :btree
  end

  create_table "job_openings", force: :cascade do |t|
    t.integer "country_id",    default: 0
    t.integer "occupation_id", default: 0
    t.boolean "enabled",       default: false
    t.integer "template"
    t.index ["country_id"], name: "index_job_openings_on_country_id", using: :btree
    t.index ["occupation_id"], name: "index_job_openings_on_occupation_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_languages_on_name", using: :btree
  end

  create_table "occupations", force: :cascade do |t|
    t.string  "name",      default: ""
    t.boolean "enabled",   default: false
    t.string  "shorthand"
    t.index ["name"], name: "index_occupations_on_name", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.string  "name"
    t.boolean "enabled", default: true
    t.index ["enabled"], name: "index_relationships_on_enabled", using: :btree
    t.index ["name"], name: "index_relationships_on_name", using: :btree
  end

  create_table "religions", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_religions_on_name", using: :btree
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "job_opening_id", default: 0
    t.integer "document_id",    default: 0
    t.boolean "enabled",        default: false
    t.index ["document_id"], name: "index_requirements_on_document_id", using: :btree
    t.index ["job_opening_id"], name: "index_requirements_on_job_opening_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_schools_on_name", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "index_skills_on_name", using: :btree
  end

  create_table "skin_types", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_skin_types_on_name", using: :btree
  end

  create_table "sources", force: :cascade do |t|
    t.string  "name",    default: ""
    t.string  "code",    default: ""
    t.string  "address", default: ""
    t.string  "tel",     default: ""
    t.string  "fax",     default: ""
    t.string  "mobile",  default: ""
    t.string  "email",   default: ""
    t.boolean "enabled", default: false
    t.index ["address"], name: "index_sources_on_address", using: :btree
    t.index ["code"], name: "index_sources_on_code", using: :btree
    t.index ["email"], name: "index_sources_on_email", using: :btree
    t.index ["fax"], name: "index_sources_on_fax", using: :btree
    t.index ["mobile"], name: "index_sources_on_mobile", using: :btree
    t.index ["name"], name: "index_sources_on_name", using: :btree
    t.index ["tel"], name: "index_sources_on_tel", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "middle_name",            default: ""
    t.integer  "role",                   default: 0,  null: false
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "zodiacs", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_zodiacs_on_name", using: :btree
  end

end
