class CreateAdminBlogEntries < ActiveRecord::Migration
  def change
    create_table :admin_blog_entries do |t|
      t.string :title
      t.string :excerpt
      t.text :body
      t.boolean :publish
      t.datetime :publish_at

      t.timestamps
    end
  end
end
