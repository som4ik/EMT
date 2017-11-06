#
# Module DynamiceRoutes provides load and reload routes from UrlsHolder records to live urls
#
# @author Somar Melhem <somar_melhem@hotmail.com>
#
module DynamiceRoutes

  #
  # generate routes from the records
  #
  # @param routes_manager: EMT::Application
  #
  def self.load( routes_manager: EMT::Application )
    routes_manager.routes.draw do
      UrlsHolder.all.each do |db_url|
        match "/#{db_url.short_url}", to: "urls_shortner#find", via: [:get], defaults: {url_id: db_url.id}
      end
    end
  end

  #
  # reload routes of the app
  #
  # @param routes_manager: EMT::Application <description>
  #
  def self.reload( routes_manager: EMT::Application )
    routes_manager.routes_reloader.reload!
  end
end
