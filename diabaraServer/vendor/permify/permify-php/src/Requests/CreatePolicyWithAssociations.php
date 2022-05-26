<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/22/22
 * Time: 2:24 PM
 */

namespace Permify\Requests;

class CreatePolicyWithAssociations extends Request {
    protected $policy;

    public function __construct($policy = array()){
        $this->policy = $policy;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return  "policies-with-associations";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        return $this->policy;
    }
}