<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:21 PM
 */

namespace Permify\Requests;

class CreateGroup extends Request
{
    protected $name;
    protected $id;
    protected $optional;

    public function __construct($name,  $optional = array()){
        $this->name = $name;
        $this->id = isset($optional['id']) ? $optional['id'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return  "groups";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['name'] = $this->name;
        if (isset($this->optional['id'])){
            $b['id'] = $this->optional['id'];
        }
        return $b;
    }
}