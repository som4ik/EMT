class CreateUrlsHolders < ActiveRecord::Migration[5.1]
  def change
    create_table :urls_holders do |t|
      t.string :long_url

      t.timestamps
    end
  end
end
