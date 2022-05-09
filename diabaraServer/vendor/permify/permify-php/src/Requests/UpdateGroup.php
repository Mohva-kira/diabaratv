<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:30 PM
 */

namespace Permify\Requests;

class UpdateGroup extends Request
{
    protected $id;
    protected $name;
    protected $optional;

    public function __construct($id, $optional = array())
    {
        $this->id = $id;
        $this->name = isset($optional['name']) ? $optional['name'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_PATCH;
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
        if (isset($this->optional['name'])) {
            $b['name'] = $this->optional['name'];
        }
        return $b;
    }
}