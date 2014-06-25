class AddedFeaturedToAdminBlogEntriesTable < ActiveRecord::Migration
	change_table :admin_blog_entries do |t|
		t.boolean :featured
	end
end
