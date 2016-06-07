namespace :delete_enclosing_tags_from_blog_body do
  desc "Delete the beginning and ending tags from Blog body."
  task delete_tags: :environment do
    Blog.all.each do |blog|
      blog.body = blog.body.delete!("<p></p><center></center>")
      blog.save
    end
  end
end
