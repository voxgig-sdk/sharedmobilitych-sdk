<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: feature_add

class SharedmobilitychFeatureAdd
{
    public static function call(SharedmobilitychContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
