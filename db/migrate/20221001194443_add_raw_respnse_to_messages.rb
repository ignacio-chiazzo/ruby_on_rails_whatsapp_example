class AddRawRespnseToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :raw_response, :text
  end
end
