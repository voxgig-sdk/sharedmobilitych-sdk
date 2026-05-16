# Sharedmobilitych SDK utility: make_context

from core.context import SharedmobilitychContext


def make_context_util(ctxmap, basectx):
    return SharedmobilitychContext(ctxmap, basectx)
