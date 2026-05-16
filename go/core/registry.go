package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewAssetEntityFunc func(client *SharedmobilitychSDK, entopts map[string]any) SharedmobilitychEntity

var NewAttributeEntityFunc func(client *SharedmobilitychSDK, entopts map[string]any) SharedmobilitychEntity

var NewProviderEntityFunc func(client *SharedmobilitychSDK, entopts map[string]any) SharedmobilitychEntity

var NewRegionEntityFunc func(client *SharedmobilitychSDK, entopts map[string]any) SharedmobilitychEntity

var NewSearchEntityFunc func(client *SharedmobilitychSDK, entopts map[string]any) SharedmobilitychEntity

