# Permify Php Library

![Twitter URL](https://img.shields.io/twitter/url?url=https%3A%2F%2Ftwitter.com%2FGetPermify)

Use [Permify](https://permify.co) in server-side PHP Projects.

## What is Permify?​
Permify is a plug-&-play authorization API that helps dev teams create granular access control and user management systems without breaking a sweat!

You can easily create complex and flexible RBAC and ABAC solutions without dealing with any learning curve.

## Installation
You can install the package via composer:
```bash
composer require permify/permify-php
```

## Setup

To get started, create the Permify client using your workspace id and API private token:
```php
use Permify\Client;

$client = new Client("workspace_id", "private_token");
```

### Documentation and Usage Instructions
See the [documentation](https://docs.permify.co) for usage instructions.

An example for better understanding of Permify with the IsAuthorized function

### Test Integration
Test that you are integrated to Permify.
```go
$res = $client->call(new TestIntegration());
```

### IsAuthorized
This method returns a decision about whether the user is authorized for this action with the given parameters.

### Parameters
* ```PolicyName``` **(mandatory)**

Custom [Permify Policy](https://docs.permify.co/docs/concepts/policies/intro) name.

* ```UserID``` **(mandatory)**

Id of the [User](https://docs.permify.co/docs/concepts/users)

* ```ResourceID``` **(optional)**

Id of the [Resource](https://docs.permify.co/docs/concepts/resources), mandatory if any resource used or accessed when creating [Rule/Rules](https://docs.permify.co/docs/concepts/policies/intro#sample-rules).

* ```ResourceType``` **(optional)**

Type or name of the [Resource](https://docs.permify.co/docs/concepts/resources), mandatory if any resource used or accessed when creating [Rule/Rules](https://docs.permify.co/docs/concepts/policies/intro#sample-rules).

```php
use Permify\Requests\IsAuthorized;

$isAuthz = $client->call(new IsAuthorized("post-edit", "1", ["resource_id"=> "1", "resource_type" => "posts"]));
echo (int) $isAuthz->allow;
```

## Error handling

For the sake of brevity, the doc instructions omit exception handling.
However, various exceptions can occur while processing request, for example because of adding an already existing user or because of timeout.

Example:
```php
use Permify\Requests;
use Permify\Exceptions;

try
{
    $resource = $client->send(
      new CreateResource("group_id", "resource_type", ["id" => "resource_id", "attributes" => ["custom attribute" => "custom"]])
    );
}
catch(Exceptions\ApiTimeoutException $e)
{
    //Handle timeout => use fallback
}
catch(Exceptions\ResponseException $e)
{
    //Handle errorneous request => use fallback
}
catch(Exceptions\PermifyException $e)
{
    //PermifyException is parent of both ResponseException and ApiTimeoutException
}
```

### Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

### Security

If you discover any security related issues, please email ege@permify.co or tolga@permify.co instead of using the issue tracker.

## Credits

-   [Tolga Ozen](https://github.com/permify)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

<h2 align="left">:heart: Let's get connected:</h2>

<p align="left">
<a href="https://twitter.com/GetPermify">
  <img alt="guilyx | Twitter" width="50px" src="https://user-images.githubusercontent.com/43545812/144034996-602b144a-16e1-41cc-99e7-c6040b20dcaf.png"/>
</a>
<a href="https://www.linkedin.com/company/permifyco">
  <img alt="guilyx's LinkdeIN" width="50px" src="https://user-images.githubusercontent.com/43545812/144035037-0f415fc7-9f96-4517-a370-ccc6e78a714b.png" />
</a>
<a href="https://discord.gg/MJbUjwskdH">
  <img alt="guilyx's Discord" width="50px" src="https://www.apkmirror.com/wp-content/uploads/2021/06/09/60dbb1f8b30bb.png" />
</a>
</p>
