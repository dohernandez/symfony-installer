# Symfony Installer with docker

## PHP Version

* PHP 7.x

## Important

* Generate project with current host user: `-u $(id -u):$(id -g)`
* Generate project on host filesystem: `-v $(pwd):/app`

## How to use it?

Using the unix utility [`make`](http://www.sis.pitt.edu/mbsclass/tutorial/advanced/makefile/whatis.htm). 

```bash
$ make
Symfony Installer

USAGE
	make command [arguments]

COMMANDS
	build: 			Build the docker image for the project.
	help: 			Symfony installer help.
	create: 		Create a new Symfony project.

SYNOPSIS
	build
	help
	create	[PROJECT_NAME] [PROJECT_ROOT_PATH] ( [VERSION] )

DESCRIPTION
	PROJECT_NAME		The name of the project

	PROJECT_ROOT_PATH	The root path of the project

	VERSION			Symfony version. (lts|2.8|3.0|...|3.3) default: 3.3
```