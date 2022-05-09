<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:59 PM
 */

namespace Permify\Requests;

class ListAction extends Request
{

    public function __construct() {}

    public function getMethod()
    {
        return Request::HTTP_GET;
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
        return $b;
    }
}