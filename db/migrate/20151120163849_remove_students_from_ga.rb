class RemoveStudentsFromGa < ActiveRecord::Migration[5.2]
  def change
    @group = Group.at_path("ga")
    return if !@group
    @group.memberships.where(is_owner: [false, nil]).delete_all
  end
end
