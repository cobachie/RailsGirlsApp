class AddLikesCountColumnToIdea < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :likes_count, :integer, default: 0
  end
end
