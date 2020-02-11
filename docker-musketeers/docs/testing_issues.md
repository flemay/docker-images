# Testing Issues

## Compose not accepting key-only .env file

In a nutshell, calling compose fails when passing a `.env` file that has key-only items in it **and** the host does not have the environment variables set. More details can be found in this [GitHub issue](https://github.com/docker/compose/issues/7180).

### Recreate the issue

```bash
# Start from the host environment with this repository checked out

# Create an empty .env file
$ echo "" > .env

# Update `Dockerfile` to install Compose version `1.25.0`
#    Something like `docker-compose==1.25.0`
# Build a new image of `flemay/musketeers`
$ make build

# Go inside a container
$ make shellDockerSock
# check compose version
$ docker-compose --version

# Create a `.env` file with key `MESSAGE`
$ echo MESSAGE > .env
# Create an environment variable
$ export MESSAGE="Hello, World"

# Go inside another test container
$ make shellTest
# Should have no issue and you can also get the value of MESSAGE and MESSAGE_2
$ env | grep MESSAGE
MESSAGE=Hello, World
MESSAGE_2=Hello, World

# exit the container and unset MESSAGE
$ exit
$ unset MESSAGE

# Go inside another test container
$ make shellTest
# You should now see the following error
TypeError: expected str, bytes or os.PathLike object, not NoneType

# Exit the container
$ exit
```

### Test fix

From the [comment](https://github.com/docker/compose/issues/7180#issuecomment-580686234) on the issue, version `1.25.4-rc2` should fix it.

```bash
# Start from the host environment with this repository checked out

# Create an empty .env file
$ echo "" > .env

# Update `Dockerfile` to install Compose version `1.25.4-rc2`
#    Something like `docker-compose==1.25.4-rc2`
# Build a new image of `flemay/musketeers`
$ make build

# Go inside a container
$ make shellDockerSock

# Create a `.env` file with key `MESSAGE`
$ echo MESSAGE > .env
# Create an environment variable
$ export MESSAGE="Hello, World"

# Go inside another test container
$ make shellTest
# Should have no issue and you can also get the value of MESSAGE and MESSAGE_2
$ env | grep MESSAGE
MESSAGE=Hello, World
MESSAGE_2=Hello, World

# exit the container and unset MESSAGE
$ exit
$ unset MESSAGE

# Go inside another test container
$ make shellTest
# You should not see the error message anymore

# Exit all containers
$ exit
$ exit
```
