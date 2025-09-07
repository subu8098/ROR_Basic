namespace :sitemap do
  desc "Generate sitemap.xml"
  task generate: :environment do
    require 'builder'
    url_helpers = Rails.application.routes.url_helpers
    host = "http://127.0.0.1:3000" 

    file_path = Rails.root.join('public', 'sitemap.xml')
    xml = Builder::XmlMarkup.new(indent: 2)

    xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
    xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
      # Homepage
      xml.url do
        xml.loc "#{host}#{url_helpers.root_path}"
        xml.lastmod Time.now.strftime('%Y-%m-%d')
        xml.changefreq 'daily'
        xml.priority '1.0'
      end

      # Articles
      Article.find_each do |article|
        xml.url do
          xml.loc "#{host}#{url_helpers.article_path(article)}"
          xml.lastmod article.updated_at.strftime('%Y-%m-%d')
          xml.changefreq 'weekly'
          xml.priority '0.7'
        end
      end
    end

    File.open(file_path, 'w') { |f| f.write(xml.target!) }
    puts "Sitemap generated at #{file_path}"
  end
end
