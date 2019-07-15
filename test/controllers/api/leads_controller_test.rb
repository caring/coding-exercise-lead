require 'test_helper'

class Api::LeadsControllerTest < ActionDispatch::IntegrationTest
  test "good params returns HTTP status created" do
    post("/api/leads.json", params: {lead: {email: "new-email@new.com" }})
    assert_response :created
  end

  test "good params returns the created lead" do
    post("/api/leads.json", params: {lead: {email: "new-email@new.com" }})
    assert_equal "new-email@new.com", response_body["lead"]["email"]
    assert_equal "unsent", response_body["lead"]["delivery_status"]
  end

  test "bad params returns HTTP status bad request" do
    post("/api/leads.json", params: {lead: {useless: "param"}})
    assert_response :bad_request
  end

  test "bad params returns errors" do
    post("/api/leads.json", params: {lead: {useless: "param"}})
    assert_equal ["Email can't be blank"], response_body["errors"]
  end

  private

  def response_body
    JSON.parse response.body
  end
end
