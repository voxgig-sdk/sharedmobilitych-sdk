<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: prepare_body

class SharedmobilitychPrepareBody
{
    public static function call(SharedmobilitychContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
