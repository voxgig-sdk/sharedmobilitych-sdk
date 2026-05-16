# ProjectName SDK exists test

import pytest
from sharedmobilitych_sdk import SharedmobilitychSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = SharedmobilitychSDK.test(None, None)
        assert testsdk is not None
