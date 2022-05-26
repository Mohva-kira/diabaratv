<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/16/22
 * Time: 6:27 PM
 */

namespace Permify\Requests;

class DeleteResource extends Request
{
    protected $id;
    protected $type;

    public function __construct($id, $type)
    {
        $this->id = $id;
        $this->type = $type;
    }

    public function getMethod()
    {
        return Request::HTTP_DELETE;
    }

    public function getPath()
    {
        return  "resources/{$this->id}/types/{$this->type}";
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