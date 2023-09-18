class MigrateContenttoRichBodyPosts < ActiveRecord::Migration[7.0]
  def up
    Post.find_each do |post|
      post.update(rich_content: post.content)
    end
  end

  def down
    Post.find_each do |post|
      post.update(content: post.rich_content)
      post.update(rich_content: nil)
    end
  end
end
