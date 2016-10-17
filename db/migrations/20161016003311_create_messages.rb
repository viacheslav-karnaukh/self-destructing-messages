Hanami::Model.migration do
  change do
  	create_table :messages do
  		primary_key :id
  		column :link, String, null: false
  		column :text, String, null: false
  	end
  end
end
