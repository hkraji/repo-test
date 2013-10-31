class InitialSchema < ActiveRecord::Migration
  def up
    # users
    create_table :users do |t|
      t.string         :username,       :null => false
      t.string         :email,          :null => true
      t.string         :first_name,     :null => false
      t.string         :last_name,      :null => false
      t.integer        :max_namespaces, :null => false, :default => 1

      t.boolean        :deleted,        :null => false, :default => false
      t.timestamps
    end

    # user groups
    create_table :user_groups do |t|
      t.string         :name,       :null => false
      t.text           :description

      t.boolean        :deleted,    :null => false, :default => false
      t.timestamps
    end

    # user user groups (many-to-many)
    create_table :users_user_groups do |t|
      t.references    :user,       :null => false
      t.references    :user_group, :null => false

      t.boolean       :deleted,        :null => false, :default => false
    end

    add_index       :users_user_groups, [:user_id, :user_group_id]

    # pub keys
    create_table :pub_keys do |t|
      t.text           :value,   :null => false
      t.references     :user,    :null => false

      t.boolean        :deleted, :null => false, :default => false
      t.timestamps
    end

    # access rights
    create_table :access_rights do |t|
      t.text           :permission_hash, :null => false
      t.string         :checksum,        :null => false, :index => true

      t.boolean        :deleted,         :null => false, :default => false
      t.timestamps
    end

    # namespaces
    create_table :namespaces do |t|
      t.string         :name,          :null => false
      t.text           :description

      t.references     :access_right,  :null => false
      t.references     :user,          :null => false
      t.references     :user_group,    :null => false

      t.boolean        :deleted,     :null => false, :default => false
      t.timestamps
    end

    # modules
    create_table :repo_modules do |t|
      t.string        :name,          :null => false
      t.string        :comp_type,     :null => false

      t.references    :namespace,     :null => false
      t.references    :access_right,  :null => false
      t.references    :user,          :null => false
      t.references    :user_group,    :null => false

      t.boolean       :deleted,       :null => false, :default => false
      t.timestamps
    end


  end

  def down
    drop_table :repo_modules
    drop_table :namespaces
    drop_table :access_rights
    drop_table :pub_keys
    drop_table :users_user_groups
    drop_table :user_groups
    drop_table :users
  end
end
