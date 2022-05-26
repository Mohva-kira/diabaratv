<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:57 PM
 */

namespace Permify\Requests;

class DeleteRole extends Request
{
    protected $name;

    public function __construct($name){
        $this->name = $name;
    }

    public function getMethod()
    {
        return Request::HTTP_DELETE;
    }

    public function getPath()
    {
        return  "roles/{$this->name}";
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