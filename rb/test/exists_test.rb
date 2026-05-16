# Sharedmobilitych SDK exists test

require "minitest/autorun"
require_relative "../Sharedmobilitych_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = SharedmobilitychSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
