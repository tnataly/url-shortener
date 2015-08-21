class AddNotNullConstraints < ActiveRecord::Migration
  def change
  	change_column_null    :links, :slug, true
  	change_column_null    :links, :given_url, true
  end
end
