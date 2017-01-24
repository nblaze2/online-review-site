class DropAdminTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :admins do |t|
      t.string   "email",              default: "", null: false
      t.string   "encrypted_password", default: "", null: false
      t.integer  "sign_in_count",      default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet     "current_sign_in_ip"
      t.inet     "last_sign_in_ip"
      t.integer  "failed_attempts",    default: 0,  null: false
      t.string   "unlock_token"
      t.datetime "locked_at"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
    end
  end
end
