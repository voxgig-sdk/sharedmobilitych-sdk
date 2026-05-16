# Sharedmobilitych SDK feature factory

from feature.base_feature import SharedmobilitychBaseFeature
from feature.test_feature import SharedmobilitychTestFeature


def _make_feature(name):
    features = {
        "base": lambda: SharedmobilitychBaseFeature(),
        "test": lambda: SharedmobilitychTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
