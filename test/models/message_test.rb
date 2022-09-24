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
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
