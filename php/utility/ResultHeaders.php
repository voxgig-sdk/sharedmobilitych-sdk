<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: result_headers

class SharedmobilitychResultHeaders
{
    public static function call(SharedmobilitychContext $ctx): ?SharedmobilitychResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
