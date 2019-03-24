# Template setup for a JupyterLab data science project
Starting a new Jupyter project should be quick and easy. Instead of starting 
your project first and then realize the terrors of version controlling and 
sharing your notebook results you can use this repository as a template for 
quickly getting started.

No one likes to clutter their working environment. That's why this repository
installs all the requirements in self contained containers and virtual
environments. This way you can quickly clone an interesting project, toy around
with the code and quickly nuke the project and all of it's requirements out of
existence when you're done. :boom:

## Table of contents
* [Requirements](#requirements)
* [Setup](#setup)
* [Working with this setup](#working-with-this-setup)
* [Using this repo as a template for your own project](#using-this-repo-as-a-template-for-your-own-project)
* [Cleaning up after yourself](#cleaning-up-after-yourself)

## Requirements
For all of this to work you need to have three things installed and set up on 
your computer:

- `make`
- `docker` https://docs.docker.com/install/
- `virtualenv` https://virtualenv.pypa.io/en/latest/installation/

## Setup
After you've installed and tested the above requirements you're ready to setup
the project. This is how you do that:

1. Clone the repository.

```
git clone git@github.com:svenanderzen/data-science-template-repo.git
```

2. (Optional) Setup a python virtual environment, install `nbstripout` and
   configure `git` to use it in the local repository. We provide a script in
   order to ease this installation. If you're just checking out the project and
   know that you're not going to provide any pull requests you can skip this
   step.

```
./scripts/setup.sh
```

3. Start a containerized JupyterLab instance and get cracking on the project.
   :hammer_and_wrench: We provide a Makefile target in order to provide the
   correct flags so that you can save those precious keypresses to something
   more useful.
   
```
make
```

4. Follow the instructions in the terminal to open the JupyterLab instance.
   Don't worry about someone else on the network accessing your notebook
   without your permission. We bind the Docker container to only listen on
   `127.0.0.1` i.e. `localhost`. This way your work is safe from prying eyes.
   :eyes:

## Working with this setup
Now, since we installed `nbstripout` inside a virtual environment we need to
activate this environment before we go ahead and use the `git` commands for 
committing and diffing `.ipynb` files. Just do:

```
source venv/bin/activate
```

before you start to working with `git` and you're good to go. :tada:

## Using this repo as a template for your own project
The aim of this repository is to serve as a template for quickly getting up and
running for your own data science projects. But how do you go about and do
that?

Simple, just follow the below steps and you should be good to go :thumbsup:

1. Clone this repository.

```
git clone git@github.com:svenanderzen/data-science-template-repo.git
```
2. Rename your cloned repository

```
mv data-science-template-repo <your_awesome_name_here>
```

3. Change the `git` remote `origin` to point to your own project

```
git remote rename origin svenanderzen/data-science-template-repo
git remote add origin <your_origin_url_here>
```

You don't need to save the old origin as
`svenanderzen/data-science-template-repo` unless you want to. However, it could
prove useful to keep it around in case you want to pull down template updates
and fixes in the future. This way you can just update your projects repository
with a simple merge commit:

```
git pull svenanderzen/data-science-template-repo master
```

## Cleaning up after yourself
If you no longer want to have the project or any of it's dependencies on your 
computer simply delete the repository folder and everything is gone! 

This works because the Docker container is started with the `--rm` flag. This
way the container is completely removed from your system as soon as you shut
down the container. But what about the `git` configurations and virtual
environment? Well, the configurations are stored in the local `.git` folder and
the dependencies `nbstripout` and `nbconvert` are stored in the `venv` folder,
so when you remove the repository folder, the `git` configurations and python
dependencies are removed as well. Simple as that :man_shrugging:
