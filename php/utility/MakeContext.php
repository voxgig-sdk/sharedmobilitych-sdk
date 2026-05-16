<?php
declare(strict_types=1);

// Sharedmobilitych SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class SharedmobilitychMakeContext
{
    public static function call(array $ctxmap, ?SharedmobilitychContext $basectx): SharedmobilitychContext
    {
        return new SharedmobilitychContext($ctxmap, $basectx);
    }
}
