<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:16 PM
 */

namespace Permify\Requests;

class UpdateUser extends Request
{
    protected $id;
    protected $name;
    protected $photo;
    protected $attributes;
    protected $optional;

    public function __construct($id, $optional = array())
    {
        $this->id = $id;
        $this->name = isset($optional['name']) ? $optional['name'] : null;
        $this->photo = isset($optional['photo']) ? $optional['photo'] : null;
        $this->attributes = isset($optional['attributes']) ? $optional['attributes'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_PATCH;
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
        if (isset($this->optional['name'])) {
            $b['name'] = $this->optional['name'];
        }
        if (isset($this->optional['photo'])) {
            $b['photo'] = $this->optional['photo'];
        }
        if (isset($this->optional['attributes'])) {
            $b['attributes'] = $this->optional['attributes'];
        }
        return $b;
    }
}