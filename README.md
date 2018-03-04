# vagrant-devops

Usefull tools used for DevOps merged into a single Vagrant utility. 

## Configured tools

In the _provision_ directory a file _provision.sh_ is ran by vagrant which has a bunch of pre-configured tools such as Jenkins, Docker and more. The provision configurations are described below.

### DevOps

* __Jenkins__
    * The default username is _admin_. The password is echoed at the end of the provision phase. Jenkins is accessible at http://localhost:8090.
* __Docker__

### WebDev
* __nodejs__
    * Including _npm_ with _gulp_, _grunt_ and _bower_ already installed.


## How to

To run the machine type in a terminal in the repo root directory:

```
vagrant up
```
