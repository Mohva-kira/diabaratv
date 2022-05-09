<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 7:14 PM
 */

namespace Permify\Requests;

class CreatePolicy extends Request
{
    protected $name;
    protected $action_alias;
    protected $any_of;
    protected $description;
    protected $rule_names;
    protected $optional;

    public function __construct($name, $action_alias, $rule_names = array(), $optional = array())
    {
        $this->name = $name;
        $this->action_alias = $action_alias;
        $this->rule_names = $rule_names;
        $this->description = isset($optional['description']) ? $optional['description'] : null;
        $this->any_of = isset($optional['any_of']) ? $optional['any_of'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "policies";
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
        $b['rule_names'] = $this->rule_names;
        if (isset($this->optional['description'])) {
            $b['description'] = $this->optional['description'];
        }
        if (isset($this->optional['any_of'])) {
            $b['any_of'] = $this->optional['any_of'];
        }
        return $b;
    }

}