<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:29 PM
 */

namespace Permify\Requests;

class ShowGroup extends Request
{
    protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function getMethod()
    {
        return Request::HTTP_GET;
    }

    public function getPath()
    {
        return "groups/{$this->id}";
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