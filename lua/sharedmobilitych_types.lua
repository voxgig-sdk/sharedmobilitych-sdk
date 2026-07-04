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

---@class Attribute
---@field description? string
---@field name? string
---@field type? string

---@class AttributeListMatch

---@class Provider
---@field contact? table
---@field coverage_area? table
---@field id? string
---@field name? string
---@field type? table
---@field website? string

---@class ProviderListMatch

---@class Region
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class RegionListMatch

---@class Search
---@field geometry? table
---@field id? string
---@field property? table
---@field type? string

---@class SearchListMatch

local M = {}

return M
