<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/15/22
 * Time: 1:12 PM
 */

namespace Permify\Exceptions;

use Permify\Requests\Request;

class ApiTimeoutException extends PermifyException
{
    public $request;

    public function __construct(Request $request, \Exception $previous = null) {
        $this->request = $request;
        $description = "Client did not get response within #{$request->getTimeout()} ms";
        parent::__construct($description, 28, $previous);
    }
}