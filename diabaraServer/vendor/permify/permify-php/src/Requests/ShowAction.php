<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 7:08 PM
 */

namespace Permify\Requests;

class ShowAction extends Request
{
    protected $alias;

    public function __construct($alias)
    {
        $this->alias = $alias;
    }

    public function getMethod()
    {
        return Request::HTTP_GET;
    }

    public function getPath()
    {
        return "actions/{$this->alias}";
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