# Sharedmobilitych SDK utility: make_context

from sharedmobilitych_sdk.core.context import SharedmobilitychContext


def make_context_util(ctxmap, basectx):
    return SharedmobilitychContext(ctxmap, basectx)
