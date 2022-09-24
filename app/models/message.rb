# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  message          :string
#  sender_number    :string
#  recipient_number :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  raw_response     :text
#
class Message < ApplicationRecord
  module Status
    DELIVERED = "delivered"
    FAILED = "failed"
    PENDING = "pending"
  end

  validates :message, presence: true
  validates_presence_of(:message, :sender_number, :recipient_number)

  def raw_response
    JSON.parse(self[:raw_response] || "") || {}
  rescue JSON::ParserError
    {}
  end

  def raw_response=(value)
    str_value = if(value.is_a?(Hash))
      value.to_json
    else 
      value
    end

    self[:raw_response] = str_value
  end
end
