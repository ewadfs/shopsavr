class AddBirthdayUsers < ActiveRecord::Migration
  def change
  	  add_column :birthday, :string
  end
end
  