class AddStudentIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :student_id, :integer
  end
end
