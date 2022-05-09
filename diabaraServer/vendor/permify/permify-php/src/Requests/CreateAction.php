<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 4/14/22
 * Time: 4:15 PM
 */

namespace Permify\Requests;

class CreateAction extends Request
{
    protected $alias;

    public function __construct($alias)
    {
        $this->alias = $alias;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "actions";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['alias'] = $this->alias;
        return $b;
    }
}