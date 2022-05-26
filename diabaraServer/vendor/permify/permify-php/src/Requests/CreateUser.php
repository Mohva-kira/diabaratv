<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 4:45 PM
 */

namespace Permify\Requests;

class CreateUser extends Request
{
    protected $id;
    protected $name;
    protected $photo;
    protected $role_names;
    protected $group_ids;
    protected $attributes;
    protected $optional;

    public function __construct($optional = array())
    {
        $this->id = isset($optional['id']) ? $optional['id'] : null;
        $this->name = isset($optional['name']) ? $optional['name'] : null;
        $this->photo = isset($optional['photo']) ? $optional['photo'] : null;
        $this->role_names = isset($optional['role_names']) ? $optional['role_names'] : null;
        $this->group_ids = isset($optional['group_ids']) ? $optional['group_ids'] : null;
        $this->attributes = isset($optional['attributes']) ? $optional['attributes'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "users";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        if (isset($this->optional['id'])){
            $b['id'] = $this->optional['id'];
        }
        if (isset($this->optional['name'])){
            $b['name'] = $this->optional['name'];
        }
        if (isset($this->optional['photo'])){
            $b['photo'] = $this->optional['photo'];
        }
        if (isset($this->optional['role_names'])){
            $b['role_names'] = $this->optional['role_names'];
        }
        if (isset($this->optional['group_ids'])){
            $b['group_ids'] = $this->optional['group_ids'];
        }
        if (isset($this->optional['attributes'])){
            $b['attributes'] = $this->optional['attributes'];
        }
        return $b;
    }
}