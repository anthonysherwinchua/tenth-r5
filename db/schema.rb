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

ActiveRecord::Schema.define(version: 20150917144849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_degrees", id: :bigint, force: :cascade do |t|
    t.text    "degree",  default: ""
    t.boolean "enabled", default: false
    t.index ["degree"], name: "idx_175029_index_academic_degrees_on_degree", using: :btree
  end

  create_table "academic_levels", id: :bigint, force: :cascade do |t|
    t.text "name"
    t.index ["name"], name: "idx_175037_index_academic_levels_on_name", using: :btree
  end

  create_table "active_admin_comments", id: :bigint, force: :cascade do |t|
    t.text     "resource_id",   null: false
    t.text     "resource_type", null: false
    t.bigint   "author_id"
    t.text     "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "namespace"
    t.index ["author_type", "author_id"], name: "idx_175043_index_active_admin_comments_on_author_type_and_autho", using: :btree
    t.index ["namespace"], name: "idx_175043_index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "idx_175043_index_admin_notes_on_resource_type_and_resource_id", using: :btree
  end

  create_table "applicant_contact_details", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id",    default: 0
    t.bigint "contact_type_id", default: 0
    t.text   "value",           default: ""
    t.index ["applicant_id"], name: "idx_175065_index_applicant_contact_details_on_applicant_id", using: :btree
    t.index ["contact_type_id"], name: "idx_175065_index_applicant_contact_details_on_contact_type_id", using: :btree
  end

  create_table "applicant_documents", id: :bigint, force: :cascade do |t|
    t.bigint   "applicant_id",      default: 0
    t.text     "file_file_name"
    t.text     "file_content_type"
    t.text     "file_file_size"
    t.datetime "file_updated_at"
    t.index ["applicant_id"], name: "idx_175074_index_applicant_documents_on_applicant_id", using: :btree
    t.index ["file_content_type"], name: "idx_175074_index_applicant_documents_on_file_content_type", using: :btree
    t.index ["file_file_name"], name: "idx_175074_index_applicant_documents_on_file_file_name", using: :btree
    t.index ["file_file_size"], name: "idx_175074_index_applicant_documents_on_file_file_size", using: :btree
    t.index ["file_updated_at"], name: "idx_175074_index_applicant_documents_on_file_updated_at", using: :btree
  end

  create_table "applicant_educations", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id",      default: 0
    t.text   "school",            default: ""
    t.bigint "academic_level_id", default: 0
    t.text   "academic_degree",   default: ""
    t.bigint "from"
    t.bigint "to"
    t.index ["applicant_id"], name: "idx_175081_index_applicant_educations_on_applicant_id", using: :btree
  end

  create_table "applicant_employments", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id", default: 0
    t.text   "occupation",   default: ""
    t.text   "country",      default: ""
    t.text   "employer",     default: ""
    t.text   "from",         default: "1990"
    t.text   "to",           default: "1990"
    t.bigint "years"
    t.text   "address",      default: ""
    t.text   "contact",      default: ""
    t.text   "salary",       default: ""
    t.index ["applicant_id"], name: "idx_175091_index_applicant_employments_on_applicant_id", using: :btree
  end

  create_table "applicant_family_details", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id", default: 0
    t.bigint "sisters"
    t.bigint "brothers"
    t.bigint "no_in_fam"
    t.bigint "eldest"
    t.bigint "youngest"
    t.bigint "children"
    t.index ["applicant_id"], name: "idx_175106_index_applicant_family_details_on_applicant_id", using: :btree
  end

  create_table "applicant_family_members", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id",    default: 0
    t.text   "occupation",      default: ""
    t.bigint "relationship_id", default: 0
    t.text   "name",            default: ""
    t.text   "salary",          default: ""
    t.bigint "age"
    t.index ["applicant_id"], name: "idx_175110_index_applicant_family_members_on_applicant_id", using: :btree
    t.index ["relationship_id"], name: "idx_175110_index_applicant_family_members_on_relationship_id", using: :btree
  end

  create_table "applicant_languages", id: :bigint, force: :cascade do |t|
    t.bigint  "applicant_id", default: 0
    t.bigint  "language_id",  default: 0
    t.boolean "read"
    t.boolean "write"
    t.boolean "speak"
    t.index ["applicant_id"], name: "idx_175121_index_applicant_languages_on_applicant_id", using: :btree
    t.index ["language_id"], name: "idx_175121_index_applicant_languages_on_language_id", using: :btree
  end

  create_table "applicant_last_updated_at", id: :bigint, force: :cascade do |t|
    t.bigint   "applicant_id", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "applicant_meta_data", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id"
    t.text   "key"
    t.text   "value"
  end

  create_table "applicant_photos", id: :bigint, force: :cascade do |t|
    t.bigint   "applicant_id",           default: 0
    t.text     "mug_shot_file_name"
    t.text     "mug_shot_content_type"
    t.text     "mug_shot_file_size"
    t.datetime "mug_shot_updated_at"
    t.text     "full_body_file_name"
    t.text     "full_body_content_type"
    t.text     "full_body_file_size"
    t.datetime "full_body_updated_at"
    t.bigint   "crop_mug_shot_x"
    t.bigint   "crop_mug_shot_y"
    t.bigint   "crop_mug_shot_w"
    t.bigint   "crop_mug_shot_h"
    t.bigint   "crop_full_body_x"
    t.bigint   "crop_full_body_y"
    t.bigint   "crop_full_body_w"
    t.bigint   "crop_full_body_h"
    t.index ["applicant_id"], name: "idx_175136_index_applicant_photos_on_applicant_id", using: :btree
    t.index ["full_body_content_type"], name: "idx_175136_index_applicant_photos_on_full_body_content_type", using: :btree
    t.index ["full_body_file_name"], name: "idx_175136_index_applicant_photos_on_full_body_file_name", using: :btree
    t.index ["full_body_file_size"], name: "idx_175136_index_applicant_photos_on_full_body_file_size", using: :btree
    t.index ["full_body_updated_at"], name: "idx_175136_index_applicant_photos_on_full_body_updated_at", using: :btree
    t.index ["mug_shot_content_type"], name: "idx_175136_index_applicant_photos_on_mug_shot_content_type", using: :btree
    t.index ["mug_shot_file_name"], name: "idx_175136_index_applicant_photos_on_mug_shot_file_name", using: :btree
    t.index ["mug_shot_file_size"], name: "idx_175136_index_applicant_photos_on_mug_shot_file_size", using: :btree
    t.index ["mug_shot_updated_at"], name: "idx_175136_index_applicant_photos_on_mug_shot_updated_at", using: :btree
  end

  create_table "applicant_requirements", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id", default: 0
    t.bigint "document_id",  default: 0
    t.date   "apply"
    t.date   "arrive"
    t.date   "expire"
    t.text   "note",         default: ""
    t.index ["applicant_id"], name: "idx_175143_index_applicant_requirements_on_applicant_id", using: :btree
    t.index ["document_id"], name: "idx_175143_index_applicant_requirements_on_document_id", using: :btree
    t.index ["document_id"], name: "idx_175143_index_applicant_requirements_on_requirement_id", using: :btree
  end

  create_table "applicant_skills", id: :bigint, force: :cascade do |t|
    t.bigint "applicant_id", default: 0
    t.bigint "skill_id",     default: 0
    t.index ["applicant_id"], name: "idx_175152_index_applicant_skills_on_applicant_id", using: :btree
    t.index ["skill_id"], name: "idx_175152_index_applicant_skills_on_skill_id", using: :btree
  end

  create_table "applicants", id: :bigint, force: :cascade do |t|
    t.bigint  "religion_id",     default: 0
    t.bigint  "citizenship_id",  default: 0
    t.bigint  "civil_status_id", default: 0
    t.text    "first_name",      default: ""
    t.text    "last_name",       default: ""
    t.text    "middle_name",     default: ""
    t.text    "suffix_name",     default: ""
    t.date    "birthday"
    t.text    "birthplace",      default: ""
    t.boolean "gender",          default: true
    t.text    "height"
    t.text    "weight"
    t.text    "video_url",       default: ""
    t.index ["birthday"], name: "idx_175049_index_applicants_on_birthday", using: :btree
    t.index ["birthplace"], name: "idx_175049_index_applicants_on_birthplace", using: :btree
    t.index ["citizenship_id"], name: "idx_175049_index_applicants_on_citizenship_id", using: :btree
    t.index ["civil_status_id"], name: "idx_175049_index_applicants_on_civil_status_id", using: :btree
    t.index ["first_name"], name: "idx_175049_index_applicants_on_first_name", using: :btree
    t.index ["gender"], name: "idx_175049_index_applicants_on_gender", using: :btree
    t.index ["height"], name: "idx_175049_index_applicants_on_height", using: :btree
    t.index ["last_name"], name: "idx_175049_index_applicants_on_last_name", using: :btree
    t.index ["middle_name"], name: "idx_175049_index_applicants_on_middle_name", using: :btree
    t.index ["religion_id"], name: "idx_175049_index_applicants_on_religion_id", using: :btree
    t.index ["suffix_name"], name: "idx_175049_index_applicants_on_suffix_name", using: :btree
    t.index ["weight"], name: "idx_175049_index_applicants_on_weight", using: :btree
  end

  create_table "application_template_files", id: :bigint, force: :cascade do |t|
    t.bigint   "application_id",          default: 0
    t.text     "pdf_file_file_name"
    t.text     "pdf_file_content_type"
    t.bigint   "pdf_file_file_size"
    t.datetime "pdf_updated_at"
    t.text     "image_file_file_name"
    t.text     "image_file_content_type"
    t.bigint   "image_file_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "template"
  end

  create_table "applications", id: :bigint, force: :cascade do |t|
    t.bigint  "applicant_id",   default: 0
    t.bigint  "job_opening_id", default: 0
    t.date    "date_applied"
    t.date    "availability"
    t.text    "applicant_code", default: ""
    t.boolean "available",      default: false
    t.index ["applicant_id"], name: "idx_175157_index_applications_on_applicant_id", using: :btree
    t.index ["job_opening_id"], name: "idx_175157_index_applications_on_job_opening_id", using: :btree
  end

  create_table "band_profiles", id: :bigint, force: :cascade do |t|
    t.bigint   "band_id"
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.bigint   "image_file_size"
    t.datetime "image_updated_at"
    t.index ["band_id"], name: "idx_175182_index_band_profiles_on_band_id", using: :btree
  end

  create_table "band_repertoires", id: :bigint, force: :cascade do |t|
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.bigint   "image_file_size"
    t.datetime "image_updated_at"
    t.bigint   "band_id"
    t.index ["band_id"], name: "idx_175188_index_band_repertoires_on_band_id", using: :btree
  end

  create_table "bands", id: :bigint, force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "cover_image_file_name"
    t.text     "cover_image_content_type"
    t.bigint   "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.boolean  "published",                default: false
    t.text     "poster_file_name"
    t.text     "poster_content_type"
    t.bigint   "poster_file_size"
    t.datetime "poster_updated_at"
    t.text     "youtube_link",             default: ""
    t.date     "available_date"
  end

  create_table "blood_types", id: :bigint, force: :cascade do |t|
    t.text "name"
    t.index ["name"], name: "idx_175194_index_blood_types_on_name", using: :btree
  end

  create_table "citizenships", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175200_index_citizenships_on_name", using: :btree
  end

  create_table "civil_statuses", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175208_index_civil_statuses_on_name", using: :btree
  end

  create_table "contact_types", id: :bigint, force: :cascade do |t|
    t.text "name"
    t.index ["name"], name: "idx_175216_index_contact_types_on_name", using: :btree
  end

  create_table "contact_us_messages", id: :bigint, force: :cascade do |t|
    t.text     "name",       default: ""
    t.text     "email",      default: ""
    t.text     "subject",    default: ""
    t.text     "message"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", id: :bigint, force: :cascade do |t|
    t.text    "iso",            default: ""
    t.text    "name",           default: ""
    t.text    "printable_name", default: ""
    t.text    "iso3",           default: ""
    t.bigint  "numcode",        default: 0
    t.boolean "enabled",        default: false
    t.index ["iso"], name: "idx_175231_index_countries_on_iso", using: :btree
    t.index ["iso3"], name: "idx_175231_index_countries_on_iso3", using: :btree
    t.index ["name"], name: "idx_175231_index_countries_on_name", using: :btree
    t.index ["numcode"], name: "idx_175231_index_countries_on_numcode", using: :btree
    t.index ["printable_name"], name: "idx_175231_index_countries_on_printable_name", using: :btree
  end

  create_table "delayed_jobs", id: :bigint, force: :cascade do |t|
    t.bigint   "priority",   default: 0, null: false
    t.bigint   "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.text     "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["priority", "run_at"], name: "idx_175243_delayed_jobs_priority", using: :btree
  end

  create_table "documents", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175251_index_documents_on_name", using: :btree
  end

  create_table "job_openings", id: :bigint, force: :cascade do |t|
    t.bigint  "country_id",    default: 0
    t.bigint  "occupation_id", default: 0
    t.boolean "enabled",       default: false
    t.bigint  "template"
    t.index ["country_id"], name: "idx_175259_index_job_openings_on_country_id", using: :btree
    t.index ["occupation_id"], name: "idx_175259_index_job_openings_on_occupation_id", using: :btree
  end

  create_table "languages", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175265_index_languages_on_name", using: :btree
  end

  create_table "occupations", id: :bigint, force: :cascade do |t|
    t.text    "name",      default: ""
    t.boolean "enabled",   default: false
    t.text    "shorthand"
    t.index ["name"], name: "idx_175273_index_occupations_on_name", using: :btree
  end

  create_table "relationships", id: :bigint, force: :cascade do |t|
    t.text    "name"
    t.boolean "enabled", default: true
    t.index ["enabled"], name: "idx_175281_index_relationships_on_enabled", using: :btree
    t.index ["name"], name: "idx_175281_index_relationships_on_name", using: :btree
  end

  create_table "religions", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175288_index_religions_on_name", using: :btree
  end

  create_table "requirements", id: :bigint, force: :cascade do |t|
    t.bigint  "job_opening_id", default: 0
    t.bigint  "document_id",    default: 0
    t.boolean "enabled",        default: false
    t.index ["document_id"], name: "idx_175296_index_requirements_on_document_id", using: :btree
    t.index ["job_opening_id"], name: "idx_175296_index_requirements_on_job_opening_id", using: :btree
  end

  create_table "roles", id: :bigint, force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.index ["role_id", "user_id"], name: "idx_175308_index_roles_users_on_role_id_and_user_id", using: :btree
  end

  create_table "schools", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175317_index_schools_on_name", using: :btree
  end

  create_table "skills", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.boolean "enabled", default: false
    t.index ["name"], name: "idx_175325_index_skills_on_name", using: :btree
  end

  create_table "skin_types", id: :bigint, force: :cascade do |t|
    t.text "name"
    t.index ["name"], name: "idx_175333_index_skin_types_on_name", using: :btree
  end

  create_table "sources", id: :bigint, force: :cascade do |t|
    t.text    "name",    default: ""
    t.text    "code",    default: ""
    t.text    "address", default: ""
    t.text    "tel",     default: ""
    t.text    "fax",     default: ""
    t.text    "mobile",  default: ""
    t.text    "email",   default: ""
    t.boolean "enabled", default: false
    t.index ["address"], name: "idx_175339_index_sources_on_address", using: :btree
    t.index ["code"], name: "idx_175339_index_sources_on_code", using: :btree
    t.index ["email"], name: "idx_175339_index_sources_on_email", using: :btree
    t.index ["fax"], name: "idx_175339_index_sources_on_fax", using: :btree
    t.index ["mobile"], name: "idx_175339_index_sources_on_mobile", using: :btree
    t.index ["name"], name: "idx_175339_index_sources_on_name", using: :btree
    t.index ["tel"], name: "idx_175339_index_sources_on_tel", using: :btree
  end

  create_table "users", id: :bigint, force: :cascade do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint   "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.text     "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "first_name",             default: ""
    t.text     "last_name",              default: ""
    t.text     "middle_name",            default: ""
    t.index ["email"], name: "idx_175353_index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "idx_175353_index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "zodiacs", id: false, force: :cascade do |t|
    t.bigint "id",   null: false
    t.text   "name"
    t.index ["id"], name: "idx_175365_primary", unique: true, using: :btree
    t.index ["name"], name: "idx_175365_index_zodiacs_on_name", using: :btree
  end

  add_foreign_key "applicant_contact_details", "applicants", name: "fk_applicant_contact_details_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_contact_details", "contact_types", name: "fk_applicant_contact_details_contact_type_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_documents", "applicants", name: "fk_applicant_documents_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_educations", "applicants", name: "fk_applicant_educations_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_employments", "applicants", name: "fk_applicant_employments_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_family_details", "applicants", name: "fk_applicant_family_details_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_family_members", "applicants", name: "fk_applicant_family_members_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_family_members", "relationships", name: "fk_applicant_family_members_relationship_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_languages", "applicants", name: "fk_applicant_languages_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_languages", "languages", name: "fk_applicant_languages_language_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_photos", "applicants", name: "fk_applicant_photos_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_requirements", "applicants", name: "fk_applicant_requirements_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_requirements", "documents", name: "fk_applicant_requirements_document_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_skills", "applicants", name: "fk_applicant_skills_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicant_skills", "skills", name: "fk_applicant_skills_skill_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicants", "citizenships", name: "fk_applicants_citizenship_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicants", "civil_statuses", name: "fk_applicants_civil_status_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applicants", "religions", name: "fk_applicants_religion_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applications", "applicants", name: "fk_applications_applicant_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "applications", "job_openings", name: "fk_applications_job_opening_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "job_openings", "countries", name: "fk_job_openings_country_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "job_openings", "occupations", name: "fk_job_openings_occupation_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "requirements", "documents", name: "fk_requirements_document_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "requirements", "job_openings", name: "fk_requirements_job_opening_id", on_update: :restrict, on_delete: :restrict
end
