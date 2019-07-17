class AddIsPriorityToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :is_priority, :boolean
    Membership.all.each do |membership|
      if membership.group.title.include?("squad")
        membership.update!(is_priority: true)
      end
    end
  end
end
