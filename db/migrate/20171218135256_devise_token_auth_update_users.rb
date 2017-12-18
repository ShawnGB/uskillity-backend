class DeviseTokenAuthUpdateUsers < ActiveRecord::Migration[5.0]
  def change
    change_table(:users) do |t|

















      ## Confirmable
      t.string   :unconfirmed_email # Only if using reconfirmable






      ## User Info
      t.string :nickname

      ## Tokens
      t.json :tokens
    end

    add_index :users, [:uid, :provider],     unique: true
    # add_index :users, :unlock_token,       unique: true
  end
end
