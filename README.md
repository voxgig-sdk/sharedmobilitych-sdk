# Sharedmobilitych SDK

Find shared cars, scooters and bikes across Switzerland by location, provider or region

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About sharedmobility.ch API

[sharedmobility.ch](https://sharedmobility.ch/) is a Swiss open data portal aggregating real-time shared-mobility offers — cars, scooters, mopeds and bikes — from the various operators active in Switzerland. The dataset is published as part of the Swiss federal open government data initiative and visualised on the official [geo.admin.ch](https://map.geo.admin.ch/) map under the shared-mobility layer.

What you get from the API:
- A live inventory of shared-mobility **assets** (vehicles / docks) with coordinates and vehicle type
- The set of **providers** participating in the feed and the **regions** they cover
- The **attributes** vocabulary describing vehicles (e.g. e-scooter, car, bike)
- Spatial **search / identify** by coordinate + tolerance radius, with paging and optional ESRI JSON geometry

The API is RESTful and documented via Swagger UI at the server root. No authentication is advertised for read access; CORS is reported as disabled by community catalogues, so browser clients may need a proxy.

## Try it

**TypeScript**
```bash
npm install sharedmobilitych
```

**Python**
```bash
pip install sharedmobilitych-sdk
```

**PHP**
```bash
composer require voxgig/sharedmobilitych-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/sharedmobilitych-sdk/go
```

**Ruby**
```bash
gem install sharedmobilitych-sdk
```

**Lua**
```bash
luarocks install sharedmobilitych-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { SharedmobilitychSDK } from 'sharedmobilitych'

const client = new SharedmobilitychSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o sharedmobilitych-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "sharedmobilitych": {
      "command": "/abs/path/to/sharedmobilitych-mcp"
    }
  }
}
```

## Entities

The API exposes 5 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Asset** | Individual shared-mobility vehicles or docks (cars, scooters, mopeds, bikes) with location and type, retrievable through the spatial identify/find endpoints. | `/identify` |
| **Attribute** | Vocabulary of vehicle/asset attributes (e.g. vehicle type such as `E-Scooter`) used to filter results. | `/attributes` |
| **Provider** | The shared-mobility operators feeding the platform; lists the companies whose fleets are exposed via the API. | `/providers` |
| **Region** | Geographic coverage areas served by one or more providers. | `/regions` |
| **Search** | Spatial lookup operations — notably `GET /v1/sharedmobility/identify` — that return assets within a radius of given coordinates, with filtering, tolerance and offset paging. | `/find` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from sharedmobilitych_sdk import SharedmobilitychSDK

client = SharedmobilitychSDK({})


# Load a specific asset
asset, err = client.Asset(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'sharedmobilitych_sdk.php';

$client = new SharedmobilitychSDK([]);


// Load a specific asset
[$asset, $err] = $client->Asset(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/sharedmobilitych-sdk/go"

client := sdk.NewSharedmobilitychSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Sharedmobilitych_sdk"

client = SharedmobilitychSDK.new({})


# Load a specific asset
asset, err = client.Asset(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("sharedmobilitych_sdk")

local client = sdk.new({})


-- Load a specific asset
local asset, err = client:Asset(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = SharedmobilitychSDK.test()
const result = await client.Asset().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = SharedmobilitychSDK.test(None, None)
result, err = client.Asset(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = SharedmobilitychSDK::test(null, null);
[$result, $err] = $client->Asset(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Asset(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = SharedmobilitychSDK.test(nil, nil)
result, err = client.Asset(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Asset(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the sharedmobility.ch API

- Upstream: [https://sharedmobility.ch/](https://sharedmobility.ch/)
- API docs: [https://api.sharedmobility.ch/](https://api.sharedmobility.ch/)

- Distributed as Swiss open government data
- Data is aggregated from third-party shared-mobility providers; provider-specific terms may apply when reusing brand or asset details
- Attribution to sharedmobility.ch (and to the underlying providers) is expected when republishing

---

Generated from the sharedmobility.ch API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
