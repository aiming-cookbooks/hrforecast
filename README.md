hrforecast Cookbook
===================

Requirements
------------

### platforms

- CentOS

### recipe

- [perlbrew](https://github.com/aiming-cookbooks/perlbrew)

Attributes
----------

#### hrforecast::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hrforecast']['database']['host']</tt></td>
    <td>String</td>
    <td>MySQL server hostname / IP address</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['database']['user_name']</tt></td>
    <td>String</td>
    <td>HRForecast database user name</td>
    <td><tt>hrforecast</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['database']['password']</tt></td>
    <td>String</td>
    <td>HRForecast database user password</td>
    <td><tt>hrforecast_password</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['application']['port']</tt></td>
    <td>Integer</td>
    <td>HRForecast application port number</td>
    <td><tt>5127</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['application']['host']</tt></td>
    <td>String</td>
    <td>HRForecast application binding host</td>
    <td><tt>0.0.0.0</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['system']['perlbrew_ver']</tt></td>
    <td>String</td>
    <td>Set perlbrew version of hrforecast install</td>
    <td><tt>perl-5.18.0</tt></td>
  </tr>
  <tr>
    <td><tt>['hrforecast']['system']['install_dir']</tt></td>
    <td>String</td>
    <td>HRForecast install directory path</td>
    <td><tt>/home/hrforecast/hrforecast_app</tt></td>
  </tr>

</table>

Usage
-----
#### hrforecast::default
Just include `hrforecast` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[hrforecast]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
LICENSE is MIT.

2013 (c) Aiming Inc.
