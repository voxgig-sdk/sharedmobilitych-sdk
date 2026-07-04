// Typed models for the Sharedmobilitych SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Asset {
  geometry?: Record<string, any>
  id?: string
  property?: Record<string, any>
  type?: string
}

export type AssetLoadMatch = Partial<Asset>

export interface Attribute {
  description?: string
  name?: string
  type?: string
}

export type AttributeListMatch = Partial<Attribute>

export interface Provider {
  contact?: Record<string, any>
  coverage_area?: any[]
  id?: string
  name?: string
  type?: any[]
  website?: string
}

export type ProviderListMatch = Partial<Provider>

export interface Region {
  geometry?: Record<string, any>
  id?: string
  property?: Record<string, any>
  type?: string
}

export type RegionListMatch = Partial<Region>

export interface Search {
  geometry?: Record<string, any>
  id?: string
  property?: Record<string, any>
  type?: string
}

export type SearchListMatch = Partial<Search>

