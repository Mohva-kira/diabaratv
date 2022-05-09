<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:13 PM
 */

namespace Permify\Requests;

class RemoveRolesFromUser extends Request
{
    protected $user_id;
    protected $role_names;

    public function __construct($user_id, $role_names = array()){
        $this->user_id = $user_id;
        $this->role_names = $role_names;
    }

    public function getMethod()
    {
        return Request::HTTP_PUT;
    }

    public function getPath()
    {
        return "users/{$this->user_id}/roles/remove";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['role_names'] = $this->role_names;
        return $b;
    }
}