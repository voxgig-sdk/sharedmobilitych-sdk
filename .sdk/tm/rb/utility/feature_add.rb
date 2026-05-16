# Sharedmobilitych SDK utility: feature_add
module SharedmobilitychUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
