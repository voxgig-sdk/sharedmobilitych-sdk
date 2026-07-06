# Typed models for the Sharedmobilitych SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Asset(TypedDict, total=False):
    geometry: dict
    id: str
    property: dict
    type: str


class AssetLoadMatchRequired(TypedDict):
    id: str


class AssetLoadMatch(AssetLoadMatchRequired, total=False):
    geometry: dict
    property: dict
    type: str


class Attribute(TypedDict, total=False):
    description: str
    name: str
    type: str


class AttributeListMatch(TypedDict, total=False):
    description: str
    name: str
    type: str


class Provider(TypedDict, total=False):
    contact: dict
    coverage_area: list
    id: str
    name: str
    type: list
    website: str


class ProviderListMatch(TypedDict, total=False):
    contact: dict
    coverage_area: list
    id: str
    name: str
    type: list
    website: str


class Region(TypedDict, total=False):
    geometry: dict
    id: str
    property: dict
    type: str


class RegionListMatch(TypedDict, total=False):
    geometry: dict
    id: str
    property: dict
    type: str


class Search(TypedDict, total=False):
    geometry: dict
    id: str
    property: dict
    type: str


class SearchListMatch(TypedDict, total=False):
    geometry: dict
    id: str
    property: dict
    type: str
