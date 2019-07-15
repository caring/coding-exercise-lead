require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  test "is invalid without an email" do
    lead = Lead.create(delivery_status: :unsent)
    assert_equal ["Email can't be blank"], lead.errors.full_messages
  end

  test "is invalid without a delivery status" do
    lead = Lead.create(email: "thing@place.com")
    assert_equal ["Delivery status can't be blank"], lead.errors.full_messages
  end
end
