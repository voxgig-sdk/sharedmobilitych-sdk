<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: result_body

class SharedmobilitychResultBody
{
    public static function call(SharedmobilitychContext $ctx): ?SharedmobilitychResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
