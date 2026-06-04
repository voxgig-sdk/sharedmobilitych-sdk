package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/sharedmobilitych-sdk/go"
	"github.com/voxgig-sdk/sharedmobilitych-sdk/go/core"

	vs "github.com/voxgig-sdk/sharedmobilitych-sdk/go/utility/struct"
)

func TestAttributeEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Attribute(nil)
		if ent == nil {
			t.Fatal("expected non-nil AttributeEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := attributeBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "attribute." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set SHAREDMOBILITYCH_TEST_ATTRIBUTE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		attributeRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.attribute", setup.data)))
		var attributeRef01Data map[string]any
		if len(attributeRef01DataRaw) > 0 {
			attributeRef01Data = core.ToMapAny(attributeRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = attributeRef01Data

		// LIST
		attributeRef01Ent := client.Attribute(nil)
		attributeRef01Match := map[string]any{}

		attributeRef01ListResult, err := attributeRef01Ent.List(attributeRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, attributeRef01ListOk := attributeRef01ListResult.([]any)
		if !attributeRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", attributeRef01ListResult)
		}

	})
}

func attributeBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "attribute", "AttributeTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read attribute test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse attribute test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"attribute01", "attribute02", "attribute03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("SHAREDMOBILITYCH_TEST_ATTRIBUTE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"SHAREDMOBILITYCH_TEST_ATTRIBUTE_ENTID": idmap,
		"SHAREDMOBILITYCH_TEST_LIVE":      "FALSE",
		"SHAREDMOBILITYCH_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["SHAREDMOBILITYCH_TEST_ATTRIBUTE_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["SHAREDMOBILITYCH_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewSharedmobilitychSDK(core.ToMapAny(mergedOpts))
	}

	live := env["SHAREDMOBILITYCH_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["SHAREDMOBILITYCH_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
