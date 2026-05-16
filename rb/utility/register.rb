# Sharedmobilitych SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

SharedmobilitychUtility.registrar = ->(u) {
  u.clean = SharedmobilitychUtilities::Clean
  u.done = SharedmobilitychUtilities::Done
  u.make_error = SharedmobilitychUtilities::MakeError
  u.feature_add = SharedmobilitychUtilities::FeatureAdd
  u.feature_hook = SharedmobilitychUtilities::FeatureHook
  u.feature_init = SharedmobilitychUtilities::FeatureInit
  u.fetcher = SharedmobilitychUtilities::Fetcher
  u.make_fetch_def = SharedmobilitychUtilities::MakeFetchDef
  u.make_context = SharedmobilitychUtilities::MakeContext
  u.make_options = SharedmobilitychUtilities::MakeOptions
  u.make_request = SharedmobilitychUtilities::MakeRequest
  u.make_response = SharedmobilitychUtilities::MakeResponse
  u.make_result = SharedmobilitychUtilities::MakeResult
  u.make_point = SharedmobilitychUtilities::MakePoint
  u.make_spec = SharedmobilitychUtilities::MakeSpec
  u.make_url = SharedmobilitychUtilities::MakeUrl
  u.param = SharedmobilitychUtilities::Param
  u.prepare_auth = SharedmobilitychUtilities::PrepareAuth
  u.prepare_body = SharedmobilitychUtilities::PrepareBody
  u.prepare_headers = SharedmobilitychUtilities::PrepareHeaders
  u.prepare_method = SharedmobilitychUtilities::PrepareMethod
  u.prepare_params = SharedmobilitychUtilities::PrepareParams
  u.prepare_path = SharedmobilitychUtilities::PreparePath
  u.prepare_query = SharedmobilitychUtilities::PrepareQuery
  u.result_basic = SharedmobilitychUtilities::ResultBasic
  u.result_body = SharedmobilitychUtilities::ResultBody
  u.result_headers = SharedmobilitychUtilities::ResultHeaders
  u.transform_request = SharedmobilitychUtilities::TransformRequest
  u.transform_response = SharedmobilitychUtilities::TransformResponse
}
