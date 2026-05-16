package voxgigsharedmobilitychsdk

import (
	"github.com/voxgig-sdk/sharedmobilitych-sdk/core"
	"github.com/voxgig-sdk/sharedmobilitych-sdk/entity"
	"github.com/voxgig-sdk/sharedmobilitych-sdk/feature"
	_ "github.com/voxgig-sdk/sharedmobilitych-sdk/utility"
)

// Type aliases preserve external API.
type SharedmobilitychSDK = core.SharedmobilitychSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type SharedmobilitychEntity = core.SharedmobilitychEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type SharedmobilitychError = core.SharedmobilitychError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAssetEntityFunc = func(client *core.SharedmobilitychSDK, entopts map[string]any) core.SharedmobilitychEntity {
		return entity.NewAssetEntity(client, entopts)
	}
	core.NewAttributeEntityFunc = func(client *core.SharedmobilitychSDK, entopts map[string]any) core.SharedmobilitychEntity {
		return entity.NewAttributeEntity(client, entopts)
	}
	core.NewProviderEntityFunc = func(client *core.SharedmobilitychSDK, entopts map[string]any) core.SharedmobilitychEntity {
		return entity.NewProviderEntity(client, entopts)
	}
	core.NewRegionEntityFunc = func(client *core.SharedmobilitychSDK, entopts map[string]any) core.SharedmobilitychEntity {
		return entity.NewRegionEntity(client, entopts)
	}
	core.NewSearchEntityFunc = func(client *core.SharedmobilitychSDK, entopts map[string]any) core.SharedmobilitychEntity {
		return entity.NewSearchEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewSharedmobilitychSDK = core.NewSharedmobilitychSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
