<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:54 PM
 */

namespace Permify\Requests;

class CreateRole extends Request
{
    protected $name;
    protected $description;
    protected $optional;

    public function __construct($name, $optional = array()){
        $this->name = $name;
        $this->description = isset($optional['description']) ? $optional['description'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return  "roles";
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
        if (isset($this->optional['description'])){
            $b['description'] = $this->optional['description'];
        }
        return $b;
    }

}