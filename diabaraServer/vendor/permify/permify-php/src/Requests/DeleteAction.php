<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 4/14/22
 * Time: 4:19 PM
 */

namespace Permify\Requests;


class DeleteAction extends Request
{
    protected $alias;

    public function __construct($alias){
        $this->alias = $alias;
    }

    public function getMethod()
    {
        return Request::HTTP_DELETE;
    }

    public function getPath()
    {
        return  "actions/{$this->alias}";
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