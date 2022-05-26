<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 7:16 PM
 */

namespace Permify\Requests;

class DeletePolicy extends Request
{
    protected $name;
    protected $action_alias;

    public function __construct($name, $action_alias)
    {
        $this->name = $name;
        $this->action_alias = $action_alias;
    }

    public function getMethod()
    {
        return Request::HTTP_DELETE;
    }

    public function getPath()
    {
        return "policies/{$this->name}/actions/{$this->action_alias}";
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



