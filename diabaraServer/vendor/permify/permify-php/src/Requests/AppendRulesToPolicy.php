<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 7:20 PM
 */

namespace Permify\Requests;

class AppendRulesToPolicy extends Request
{
    protected $policy_name;
    protected $action_alias;
    protected $rule_names;

    public function __construct($policy_name, $action_alias, $rule_names = array())
    {
        $this->policy_name = $policy_name;
        $this->action_alias = $action_alias;
        $this->rule_names = $rule_names;
    }

    public function getMethod()
    {
        return Request::HTTP_PUT;
    }

    public function getPath()
    {
        return "policies/{$this->policy_name}/{${$this->action_alias}}/rules/append";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['rule_names'] = $this->rule_names;
        return $b;
    }
}