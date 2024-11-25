<?php

use PHPUnit\Framework\TestCase;
use App\Example;

class AppTest extends TestCase
{
    public function testAppExample()
    {
        $example = new Example();
        $this->assertEquals("App Example", $example->getName());
    }
}
