<?php
declare(strict_types=1);

// Sharedmobilitych SDK base feature

class SharedmobilitychBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(SharedmobilitychContext $ctx, array $options): void {}
    public function PostConstruct(SharedmobilitychContext $ctx): void {}
    public function PostConstructEntity(SharedmobilitychContext $ctx): void {}
    public function SetData(SharedmobilitychContext $ctx): void {}
    public function GetData(SharedmobilitychContext $ctx): void {}
    public function GetMatch(SharedmobilitychContext $ctx): void {}
    public function SetMatch(SharedmobilitychContext $ctx): void {}
    public function PrePoint(SharedmobilitychContext $ctx): void {}
    public function PreSpec(SharedmobilitychContext $ctx): void {}
    public function PreRequest(SharedmobilitychContext $ctx): void {}
    public function PreResponse(SharedmobilitychContext $ctx): void {}
    public function PreResult(SharedmobilitychContext $ctx): void {}
    public function PreDone(SharedmobilitychContext $ctx): void {}
    public function PreUnexpected(SharedmobilitychContext $ctx): void {}
}
