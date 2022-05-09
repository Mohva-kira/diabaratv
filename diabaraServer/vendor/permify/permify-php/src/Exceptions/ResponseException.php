<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/15/22
 * Time: 1:22 PM
 */

namespace Permify\Exceptions;

class ResponseException extends PermifyException
{
    public $request;

    public $status_code;

    public $description;

    public function __construct($request, $status_code, $description, \Exception $previous = null)
    {
        $this->request = $request;
        $this->status_code = $status_code;
        $this->description = $description;
        parent::__construct($description, $status_code, $previous);
    }
}