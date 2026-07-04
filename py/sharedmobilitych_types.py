# Typed models for the Sharedmobilitych SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Asset:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class AssetLoadMatch:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class Attribute:
    description: Optional[str] = None
    name: Optional[str] = None
    type: Optional[str] = None


@dataclass
class AttributeListMatch:
    description: Optional[str] = None
    name: Optional[str] = None
    type: Optional[str] = None


@dataclass
class Provider:
    contact: Optional[dict] = None
    coverage_area: Optional[list] = None
    id: Optional[str] = None
    name: Optional[str] = None
    type: Optional[list] = None
    website: Optional[str] = None


@dataclass
class ProviderListMatch:
    contact: Optional[dict] = None
    coverage_area: Optional[list] = None
    id: Optional[str] = None
    name: Optional[str] = None
    type: Optional[list] = None
    website: Optional[str] = None


@dataclass
class Region:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class RegionListMatch:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class Search:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class SearchListMatch:
    geometry: Optional[dict] = None
    id: Optional[str] = None
    property: Optional[dict] = None
    type: Optional[str] = None

