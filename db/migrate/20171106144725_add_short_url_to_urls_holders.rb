class AddShortUrlToUrlsHolders < ActiveRecord::Migration[5.1]
  def change
    add_column :urls_holders, :short_url, :string
  end
end
