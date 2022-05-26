<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 7:22 PM
 */

namespace Permify\Requests;

class RemoveGroupsFromUser extends Request
{
    protected $user_id;
    protected $group_ids;

    public function __construct($user_id, $group_ids = array())
    {
        $this->user_id = $user_id;
        $this->group_ids = $group_ids;
    }

    public function getMethod()
    {
        return Request::HTTP_PUT;
    }

    public function getPath()
    {
        return "users/{$this->user_id}/groups/remove";
    }

    public function getQueryParameters()
    {
        $params = array();
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        $b['group_ids'] = $this->group_ids;
        return $b;
    }

}