<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:24 PM
 */

namespace Permify\Requests;


class DeleteGroup extends Request
{
    protected $id;

    public function __construct($id){
        $this->id = $id;
    }

    public function getMethod()
    {
        return Request::HTTP_DELETE;
    }

    public function getPath()
    {
        return  "groups/{$this->id}";
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