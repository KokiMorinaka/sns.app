class AddColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :deadline, :date
    add_column :posts, :recruitment_number, :integer
  end
end
