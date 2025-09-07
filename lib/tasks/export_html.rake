namespace :export do
  desc "Export all article show pages as static HTML"
  task article_shows: :environment do
    Dir.mkdir("exported_html") unless Dir.exist?("exported_html")
    Dir.mkdir("exported_html/articles") unless Dir.exist?("exported_html/articles")

    Article.find_each do |article|
      # Create a subfolder for each article
      article_folder = "exported_html/articles/#{article.id}"
      Dir.mkdir(article_folder) unless Dir.exist?(article_folder)

      # Export show page
      html = ApplicationController.render(
        template: 'articles/show',
        assigns: { article: article }
      )
      file_path = "#{article_folder}/show.html"
      File.write(file_path, html)
      puts "Exported #{file_path}"
    end
  end
end
