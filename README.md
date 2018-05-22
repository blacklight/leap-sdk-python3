# Leap Motion SDK Python 3 module builer

The Leap Motion Python module is not [not officially compatible with Python 3](https://developer.leapmotion.com/documentation/python/devguide/Project_Setup.html#recompiling-leappython-for-python-3).

This project aims to provide a simple and automated way to build and install your Python 3 module for the Leap Motion.

## Dependencies

- `swig`
- `g++`
- `libpython3-dev` (on Debian/Ubuntu)

## Build the module

```shell
make
```

## Install the module

```shell
[sudo] make install
```

`PREFIX` (where both `libLeap.so` and the Python bindings will be installed) points to `/usr` by default. Change it if required:

```shell
PREFIX=/your/local/prefix make install
```

## Clean the source directory

```shell
make clean
```

## Uninstall the module

```shell
[sudo] make uninstall
```

