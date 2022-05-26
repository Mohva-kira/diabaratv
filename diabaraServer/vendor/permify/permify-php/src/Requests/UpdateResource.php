<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:39 PM
 */

namespace Permify\Requests;

class UpdateResource extends Request
{
    protected $id;
    protected $type;
    protected $attributes;
    protected $optional;

    public function __construct($id, $type, $optional = array())
    {
        $this->id = $id;
        $this->type = $type;
        $this->attributes = isset($optional['attributes']) ? $optional['attributes'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_PATCH;
    }

    public function getPath()
    {
        return "resources/{$this->id}/types/{$this->type}";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        if (isset($this->optional['attributes'])) {
            $b['attributes'] = $this->optional['attributes'];
        }
        return $b;
    }

}