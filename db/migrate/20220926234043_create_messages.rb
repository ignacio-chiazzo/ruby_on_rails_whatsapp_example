class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.string :sender_number
      t.string :recipient_number
      t.string :status
      
      t.timestamps
    end
  end
end
