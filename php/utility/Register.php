<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

SharedmobilitychUtility::setRegistrar(function (SharedmobilitychUtility $u): void {
    $u->clean = [SharedmobilitychClean::class, 'call'];
    $u->done = [SharedmobilitychDone::class, 'call'];
    $u->make_error = [SharedmobilitychMakeError::class, 'call'];
    $u->feature_add = [SharedmobilitychFeatureAdd::class, 'call'];
    $u->feature_hook = [SharedmobilitychFeatureHook::class, 'call'];
    $u->feature_init = [SharedmobilitychFeatureInit::class, 'call'];
    $u->fetcher = [SharedmobilitychFetcher::class, 'call'];
    $u->make_fetch_def = [SharedmobilitychMakeFetchDef::class, 'call'];
    $u->make_context = [SharedmobilitychMakeContext::class, 'call'];
    $u->make_options = [SharedmobilitychMakeOptions::class, 'call'];
    $u->make_request = [SharedmobilitychMakeRequest::class, 'call'];
    $u->make_response = [SharedmobilitychMakeResponse::class, 'call'];
    $u->make_result = [SharedmobilitychMakeResult::class, 'call'];
    $u->make_point = [SharedmobilitychMakePoint::class, 'call'];
    $u->make_spec = [SharedmobilitychMakeSpec::class, 'call'];
    $u->make_url = [SharedmobilitychMakeUrl::class, 'call'];
    $u->param = [SharedmobilitychParam::class, 'call'];
    $u->prepare_auth = [SharedmobilitychPrepareAuth::class, 'call'];
    $u->prepare_body = [SharedmobilitychPrepareBody::class, 'call'];
    $u->prepare_headers = [SharedmobilitychPrepareHeaders::class, 'call'];
    $u->prepare_method = [SharedmobilitychPrepareMethod::class, 'call'];
    $u->prepare_params = [SharedmobilitychPrepareParams::class, 'call'];
    $u->prepare_path = [SharedmobilitychPreparePath::class, 'call'];
    $u->prepare_query = [SharedmobilitychPrepareQuery::class, 'call'];
    $u->result_basic = [SharedmobilitychResultBasic::class, 'call'];
    $u->result_body = [SharedmobilitychResultBody::class, 'call'];
    $u->result_headers = [SharedmobilitychResultHeaders::class, 'call'];
    $u->transform_request = [SharedmobilitychTransformRequest::class, 'call'];
    $u->transform_response = [SharedmobilitychTransformResponse::class, 'call'];
});
