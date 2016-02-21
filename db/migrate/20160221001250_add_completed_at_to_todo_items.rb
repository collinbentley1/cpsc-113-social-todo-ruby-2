class AddCompletedAtToTodoItems < ActiveRecord::Migration
  def change
    add_column :microposts, :completed_at, :datetime
  end
end
