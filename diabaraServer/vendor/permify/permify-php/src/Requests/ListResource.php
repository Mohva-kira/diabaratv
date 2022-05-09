<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:34 PM
 */

namespace Permify\Requests;

class ListResource extends Request
{
    protected $group_ids;
    protected $types;
    protected $page;
    protected $limit;
    protected $order_by;
    protected $sort_by;
    protected $optional;

    public function __construct($optional = array())
    {
        $this->group_ids = isset($optional['group_ids']) ? $optional['group_ids'] : null;
        $this->types = isset($optional['types']) ? $optional['types'] : null;
        $this->page = isset($optional['page']) ? $optional['page'] : null;
        $this->limit = isset($optional['limit']) ? $optional['limit'] : null;
        $this->order_by = isset($optional['order_by']) ? $optional['order_by'] : null;
        $this->sort_by = isset($optional['sort_by']) ? $optional['sort_by'] : null;
        $this->optional = $optional;
    }

    public function getMethod()
    {
        return Request::HTTP_GET;
    }

    public function getPath()
    {
        return "resources";
    }

    public function getQueryParameters()
    {
        $params = array();
        if (isset($this->optional['group_ids'])) {
            $params['group_ids'] = $this->optional['group_ids'];
        }
        if (isset($this->optional['types'])) {
            $params['types'] = $this->optional['types'];
        }
        if (isset($this->optional['page'])) {
            $params['page'] = $this->optional['page'];
        }
        if (isset($this->optional['limit'])) {
            $params['limit'] = $this->optional['limit'];
        }
        if (isset($this->optional['order_by'])) {
            $params['order_by'] = $this->optional['order_by'];
        }
        if (isset($this->optional['sort_by'])) {
            $params['sort_by'] = $this->optional['sort_by'];
        }
        return $params;
    }

    public function getBodyParameters()
    {
        $b = array();
        return $b;
    }

}