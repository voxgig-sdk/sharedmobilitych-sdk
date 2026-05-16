<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: feature_hook

class SharedmobilitychFeatureHook
{
    public static function call(SharedmobilitychContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
