<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 5:28 PM
 */

namespace Permify\Requests;

class ListGroup extends Request
{
    protected $page;
    protected $limit;
    protected $order_by;
    protected $sort_by;
    protected $optional;

    public function __construct($optional = array())
    {
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
        return "groups";
    }

    public function getQueryParameters()
    {
        $params = array();
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