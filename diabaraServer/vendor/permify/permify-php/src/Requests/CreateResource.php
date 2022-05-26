<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:22 PM
 */

namespace Permify\Requests;

class CreateResource extends Request
{
    protected $type;
    protected $id;
    protected $attributes;
    protected $optional;

    public function __construct($type, $optional = array())
    {
        $this->type = $type;
        $this->id = isset($optional['id']) ? $optional['id'] : null;
        $this->id = isset($optional['group_id']) ? $optional['group_id'] : null;
        $this->attributes = isset($optional['attributes']) ? $optional['attributes'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "resources";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['type'] = $this->type;
        if (isset($this->optional['id'])){
            $b['id'] = $this->optional['id'];
        }
        if (isset($this->optional['group_id'])){
            $b['group_id'] = $this->optional['group_id'];
        }
        if (isset($this->optional['attributes'])){
            $b['attributes'] = $this->optional['attributes'];
        }
        return $b;
    }

}