# frozen_string_literal: true

# Typed models for the Sharedmobilitych SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Asset entity data model.
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Asset = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

# Match filter for Asset#load (any subset of Asset fields).
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
AssetLoadMatch = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

# Attribute entity data model.
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Attribute = Struct.new(
  :description,
  :name,
  :type,
  keyword_init: true
)

# Match filter for Attribute#list (any subset of Attribute fields).
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
AttributeListMatch = Struct.new(
  :description,
  :name,
  :type,
  keyword_init: true
)

# Provider entity data model.
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] coverage_area
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [Array, nil]
#
# @!attribute [rw] website
#   @return [String, nil]
Provider = Struct.new(
  :contact,
  :coverage_area,
  :id,
  :name,
  :type,
  :website,
  keyword_init: true
)

# Match filter for Provider#list (any subset of Provider fields).
#
# @!attribute [rw] contact
#   @return [Hash, nil]
#
# @!attribute [rw] coverage_area
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [Array, nil]
#
# @!attribute [rw] website
#   @return [String, nil]
ProviderListMatch = Struct.new(
  :contact,
  :coverage_area,
  :id,
  :name,
  :type,
  :website,
  keyword_init: true
)

# Region entity data model.
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Region = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

# Match filter for Region#list (any subset of Region fields).
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
RegionListMatch = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

# Search entity data model.
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Search = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

# Match filter for Search#list (any subset of Search fields).
#
# @!attribute [rw] geometry
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
SearchListMatch = Struct.new(
  :geometry,
  :id,
  :property,
  :type,
  keyword_init: true
)

