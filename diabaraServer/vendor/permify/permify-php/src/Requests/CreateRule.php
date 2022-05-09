<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:42 PM
 */

namespace Permify\Requests;

class CreateRule extends Request
{
    protected $name;
    protected $condition;
    protected $fail_message;
    protected $description;
    protected $optional;

    public function __construct($name, $condition, $optional = array())
    {
        $this->name = $name;
        $this->condition = $condition;
        $this->description = isset($optional['description']) ? $optional['description'] : null;
        $this->fail_message = isset($optional['fail_message']) ? $optional['fail_message'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "rules";
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
        $b['condition'] = $this->condition;
        if (isset($this->optional['fail_message'])) {
            $b['fail_message'] = $this->optional['fail_message'];
        }
        if (isset($this->optional['description'])) {
            $b['description'] = $this->optional['description'];
        }
        return $b;
    }
}