ActiveRecord::Schema.define(version: 20141109131209) do

  create_table "users", force: true do |t|
    t.string   "screen_name"
    t.string   "full_name"
    t.string   "email"
    t.string   "description"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
