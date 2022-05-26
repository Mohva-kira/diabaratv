<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 3:08 PM
 */

namespace Permify\Requests;

class IsAuthorized extends Request
{

    protected $policy_name;
    protected $action_alias;
    protected $user_id;
    protected $cascade_create;
    protected $resource_id;
    protected $resource_type;
    protected $environment;
    protected $optional;

    public function __construct($policy_name, $action_alias, $user_id, $optional = array())
    {
        $this->policy_name = $policy_name;
        $this->action_alias = $action_alias;
        $this->user_id = $user_id;
        $this->cascade_create = isset($optional['cascade_create']) ? $optional['cascade_create'] : null;
        $this->resource_id = isset($optional['resource_id']) ? $optional['resource_id'] : null;
        $this->resource_type = isset($optional['resource_type']) ? $optional['resource_type'] : null;
        $this->environment = isset($optional['environment']) ? $optional['environment'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_POST;
    }

    public function getPath()
    {
        return "is-authorized";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['policy_name'] = $this->policy_name;
        $b['action_alias'] = $this->action_alias;
        $b['user_id'] = $this->user_id;
        if (isset($this->optional['cascade_create'])) {
            $b['cascade_create'] = $this->optional['cascade_create'];
        }
        if (isset($this->optional['resource_id'], $this->optional['resource_type'])) {
            $b['resource_id'] = $this->optional['resource_id'];
            $b['resource_type'] = $this->optional['resource_type'];
        }
        if (isset($this->optional['environment'])){
            $b['environment'] = $this->optional['environment'];
        }
        return $b;
    }
}