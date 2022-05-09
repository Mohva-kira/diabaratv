<?php
/**
 * Created by PhpStorm.
 * User: tolgaozen
 * Date: 3/15/22
 * Time: 10:41 AM
 */

namespace Permify;

use Permify\Exceptions\ApiTimeoutException;
use Permify\Exceptions\ResponseException;

use Permify\Requests\Request;

const BASE_URL = "https://papi.permify.co";
const VERSION = "v1";

class Client
{

    protected $workspace_id;
    protected $private_token;

    protected $api_client;
    protected $request;

    public function __construct($workspace_id, $private_token)
    {
        $this->workspace_id = $workspace_id;
        $this->private_token = $private_token;
        $this->api_client = new \GuzzleHttp\Client([
            'headers' => [
                "User-Agent" => "permify-php (version: " . VERSION . ")",
                'Content-Type' => 'application/json',
            ]
        ]);
    }

    public function call(Request $request)
    {
        //path construction
        $path = "/" . VERSION . "/api/workspaces/" . $this->workspace_id . "/" . $request->getPath() . $this->paramsToUrl(array_merge(["type" => "backend"], $request->getQueryParameters())) . "&hmac_timestamp=" . time();

        //create hmac_sign
        $sign = $this->signUrl($path);

        //finalize url
        $url = BASE_URL . $path . $sign;

        //initialize response
        $response = null;

        $timeout = $request->getTimeout() / 1000;

        try {
            switch ($request->getMethod()) {
                case Request::HTTP_GET:
                    $response = $this->get($url, $timeout);
                    break;
                case Request::HTTP_POST:
                    $json = json_encode($request->getBodyParameters(), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                    $response = $this->post($url, $timeout, $json);
                    break;
                case Request::HTTP_PUT:
                    $json = json_encode($request->getBodyParameters(), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                    $response = $this->put($url, $timeout, $json);
                    break;
                case Request::HTTP_PATCH:
                    $json = json_encode($request->getBodyParameters(), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                    $response = $this->patch($url, $timeout, $json);
                    break;
                case Request::HTTP_DELETE:
                    $response = $this->delete($url, $timeout);
                    break;
                default;
                    break;
            }
        }
        catch(\GuzzleHttp\Exception\ConnectException $e)
        {
            throw new ApiTimeoutException($request, $e);
        }
        catch(\GuzzleHttp\Exception\GuzzleException $e)
        {
            if(strpos($e->getMessage(), 'cURL error 28') !== false) throw new ApiTimeoutException($request, $e);
            if(strpos($e->getMessage(), 'timed out') !== false) throw new ApiTimeoutException($request, $e);
            throw $e;
        }

        return $response->data;
    }

    /* ----------------------- Send requests -----------------------  */

    protected function get($path, $timeout)
    {
        $options = array('timeout' => $timeout);
        $response = $this->api_client->request('GET', $path, $options);
        $this->checkResponse($response);
        return json_decode($response->getBody());
    }

    protected function post($path, $timeout, $body)
    {
        $options = array('timeout' => $timeout);
        $response = $this->api_client->request('POST', $path, array_merge($options, ['body' => $body]));
        return json_decode($response->getBody());
    }

    protected function put($path, $timeout, $body)
    {
        $options = array('timeout' => $timeout);
        $response = $this->api_client->request('PUT', $path, array_merge($options, ['body' => $body]));
        $this->checkResponse($response);
        return json_decode($response->getBody());
    }

    protected function patch($path, $timeout, $body)
    {
        $options = array('timeout' => $timeout);
        $response = $this->api_client->request('PATCH', $path, array_merge($options, ['body' => $body]));
        $this->checkResponse($response);
        return json_decode($response->getBody());
    }

    protected function delete($path, $timeout)
    {
        $options = array('timeout' => $timeout);
        $response = $this->api_client->request('DELETE', $path, $options);
        $this->checkResponse($response);
        return json_decode($response->getBody());
    }

    protected function checkResponse($response) {
        $status_code = $response->getStatusCode();
        if($status_code == 200 || $status_code == 201) return;
        throw new ResponseException($this->request, $status_code, $response->getBody());
    }

    /* ----------------------- HMAC -----------------------  */

    protected function signUrl($path)
    {
        return "&hmac_sign=" . hash_hmac('sha1', $path, $this->private_token);
    }

    /* ----------------------- URL -----------------------  */

    function paramsToUrl($params){
        if (!$params) return '';
        $url = array();
        foreach ($params as $p => $val) {
            array_push($url, urlencode($p) . '=' . urlencode($this->formatQueryParameterValue($val)));
        }
        $result = '?' . implode('&', $url);
        return $result;
    }

    function formatQueryParameterValue($value)
    {
        if (is_array($value))
            return implode(',', $value);
        if (is_bool($value))
            return ($value) ? 'true' : 'false';

        else return $value;
    }
}