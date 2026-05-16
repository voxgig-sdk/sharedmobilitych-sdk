# Asset entity test

require "minitest/autorun"
require "json"
require_relative "../Sharedmobilitych_sdk"
require_relative "runner"

class AssetEntityTest < Minitest::Test
  def test_create_instance
    testsdk = SharedmobilitychSDK.test(nil, nil)
    ent = testsdk.Asset(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = asset_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "asset." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set SHAREDMOBILITYCH_TEST_ASSET_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    asset_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.asset")))
    asset_ref01_data = nil
    if asset_ref01_data_raw.length > 0
      asset_ref01_data = Helpers.to_map(asset_ref01_data_raw[0][1])
    end

    # LOAD
    asset_ref01_ent = client.Asset(nil)
    asset_ref01_match_dt0 = {
      "id" => asset_ref01_data["id"],
    }
    asset_ref01_data_dt0_loaded, err = asset_ref01_ent.load(asset_ref01_match_dt0, nil)
    assert_nil err
    asset_ref01_data_dt0_load_result = Helpers.to_map(asset_ref01_data_dt0_loaded)
    assert !asset_ref01_data_dt0_load_result.nil?
    assert_equal asset_ref01_data_dt0_load_result["id"], asset_ref01_data["id"]

  end
end

def asset_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "asset", "AssetTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = SharedmobilitychSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["asset01", "asset02", "asset03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["SHAREDMOBILITYCH_TEST_ASSET_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "SHAREDMOBILITYCH_TEST_ASSET_ENTID" => idmap,
    "SHAREDMOBILITYCH_TEST_LIVE" => "FALSE",
    "SHAREDMOBILITYCH_TEST_EXPLAIN" => "FALSE",
    "SHAREDMOBILITYCH_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["SHAREDMOBILITYCH_TEST_ASSET_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["SHAREDMOBILITYCH_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["SHAREDMOBILITYCH_APIKEY"],
      },
      extra || {},
    ])
    client = SharedmobilitychSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["SHAREDMOBILITYCH_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["SHAREDMOBILITYCH_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
