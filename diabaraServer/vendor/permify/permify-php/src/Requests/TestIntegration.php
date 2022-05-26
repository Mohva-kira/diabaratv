<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 4/16/22
 * Time: 2:47 PM
 */

namespace Permify\Requests;

class TestIntegration extends Request
{

    public function __construct(){}

    public function getMethod()
    {
        return Request::HTTP_GET;
    }

    public function getPath()
    {
        return "test-integration";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        return $b;
    }

}