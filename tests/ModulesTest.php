<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use Modules\Example;

class ModulesTest extends TestCase
{
    public function testModulesExample()
    {
        $example = new Example();
        $this->assertEquals("Modules Example", $example->getName());
    }
}
