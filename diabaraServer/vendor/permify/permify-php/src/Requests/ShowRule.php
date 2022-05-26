<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:52 PM
 */

namespace Permify\Requests;

class ShowRule extends Request
{
    protected $name;

    public function __construct($name)
    {
        $this->name = $name;
    }

    public function getMethod()
    {
        return Request::HTTP_GET;
    }

    public function getPath()
    {
        return "rules/{$this->name}";
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