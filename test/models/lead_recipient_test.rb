require 'test_helper'

class LeadRecipientTest < ActiveSupport::TestCase
  test "is invalid without an email" do
    lead_recipient = LeadRecipient.create
    assert_equal ["Email can't be blank"], lead_recipient.errors.full_messages
  end
end
