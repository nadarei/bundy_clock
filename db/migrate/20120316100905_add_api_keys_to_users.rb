class AddApiKeysToUsers < ActiveRecord::Migration
  def up
    add_column :users, :api_key, :string

    User.all.each do |user|
      user.generate_api_key
      user.save
    end
  end

  def down
    remove_column :users, :api_key
  end
end
