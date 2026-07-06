-- Typed models for the Sharedmobilitych SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Asset
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class AssetLoadMatch
---@field geometry? table
---@field id string
---@field property? table
---@field type? string

---@class Attribute
---@field description? string
---@field name? string
---@field type? string

---@class AttributeListMatch
---@field description? string
---@field name? string
---@field type? string

---@class Provider
---@field contact? table
---@field coverage_area? table
---@field id? string
---@field name? string
---@field type? table
---@field website? string

---@class ProviderListMatch
---@field contact? table
---@field coverage_area? table
---@field id? string
---@field name? string
---@field type? table
---@field website? string

---@class Region
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class RegionListMatch
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class Search
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class SearchListMatch
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

local M = {}

return M
