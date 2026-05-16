<?php
declare(strict_types=1);

// Sharedmobilitych SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class SharedmobilitychFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new SharedmobilitychBaseFeature();
            case "test":
                return new SharedmobilitychTestFeature();
            default:
                return new SharedmobilitychBaseFeature();
        }
    }
}
