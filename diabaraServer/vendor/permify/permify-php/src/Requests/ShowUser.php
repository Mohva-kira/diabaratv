<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 12:37 AM
 */

namespace Permify\Requests;

class ShowUser extends Request
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
        return "users/{$this->id}";
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