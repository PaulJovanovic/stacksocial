class CreateQueryLogTable < ActiveRecord::Migration
  def change
  	create_table :query_logs do |t|
    	t.string :query
      t.timestamps
    end
  end
end
