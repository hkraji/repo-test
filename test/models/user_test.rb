require 'test_helper'
require 'pp'

class UserTest < ActiveSupport::TestCase

  test "ultimate" do
    user_group = UserGroup.new(:name => 'dtk', :description => 'DTK group')
    user_group.save!

    user = User.new
    user.username   = 'dtk-haris'
    user.first_name = 'Haris'
    user.last_name  = 'Krajina'
    user.email      = 'haris@atlantbh.com'
    user.user_groups << user_group

    user.save!

=begin
    access_right = AccessRight.new(
      :permission_hash => { :user => 'RWD', :user_group => 'RW', :other => 'R'}
    )

    namespace1 = Namespace.create(
        :user         => user,
        :user_group   => user.user_groups.first,
        :access_right => access_right,
        :name         => 'dtk'
    )

    pp "NAMESACES *****************************************************"
    pp namespaces = Namespace.all
    pp "***************************************************************"
    pp "Username #{namespaces.first.user.username}"
    pp "Group #{namespaces.first.user_group.name}"
    pp "Permissions:"
    pp namespaces.first.access_right.permission_hash

    module1 = RepoModule.create(
        :name => 'postgre',
        :comp_type => 'component',
        :namespace_id => namespace1.id,
        :user => user,
        :user_group => user_group,
        :access_right => access_right
    )

    pp "MODULE *****************************************************"
    pp RepoModule.find(1)
    pp "***************************************************************"

    # create another namespace
    namespace2 = Namespace.create(
        :user         => user,
        :user_group   => user.user_groups.first,
        :access_right => access_right,
        :name         => 'dtk2'
    )

    module2 = RepoModule.create(
        :name => 'postgre',
        :comp_type => 'component',
        :namespace => namespace2,
        :user => user,
        :user_group => user_group,
        :access_right => access_right
    )

    pp "MODULE *****************************************************"
    pp RepoModule.find(2)
    pp "***************************************************************"
=end

  end
end