<?php
declare(strict_types=1);

// Typed models for the Sharedmobilitych SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Asset entity data model. */
class Asset
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

/** Match filter for Asset#load (any subset of Asset fields). */
class AssetLoadMatch
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

/** Attribute entity data model. */
class Attribute
{
    public ?string $description = null;
    public ?string $name = null;
    public ?string $type = null;
}

/** Match filter for Attribute#list (any subset of Attribute fields). */
class AttributeListMatch
{
    public ?string $description = null;
    public ?string $name = null;
    public ?string $type = null;
}

/** Provider entity data model. */
class Provider
{
    public ?array $contact = null;
    public ?array $coverage_area = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?array $type = null;
    public ?string $website = null;
}

/** Match filter for Provider#list (any subset of Provider fields). */
class ProviderListMatch
{
    public ?array $contact = null;
    public ?array $coverage_area = null;
    public ?string $id = null;
    public ?string $name = null;
    public ?array $type = null;
    public ?string $website = null;
}

/** Region entity data model. */
class Region
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

/** Match filter for Region#list (any subset of Region fields). */
class RegionListMatch
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

/** Search entity data model. */
class Search
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

/** Match filter for Search#list (any subset of Search fields). */
class SearchListMatch
{
    public ?array $geometry = null;
    public ?string $id = null;
    public ?array $property = null;
    public ?string $type = null;
}

