# Shared Terminal Workshops

This is a set of files for running interactive, terminal-based workshops.

The presenter runs `./present.sh` to start a virtual machine that participants can SSH into. Upon
logging in, each participant is put into a separate Docker container running a shell (under
Ubuntu). This container has a directory `exercises` for the participant to work on, using
command-line tools and console-based editors such as `nano` or `vim`.

Moreover, each participant's session is shown as a tab on the presenter's screen using `tmux`. This
screen can be shown using a monitor or projector. The presenter can navigate to a participant's tab
and, using `tmux`s session sharing capabilities, see what is going on or even participate in the
session.

## Acknowledgements

This project uses [VirtualBox](https://www.virtualbox.org/), [Vagrant](https://www.vagrantup.com/),
[Puppet](http://puppetlabs.com/), [tmux](http://tmux.sourceforge.net/) and
[Docker](https://www.docker.com/).

## Caveats

As the workshop VM exposes port 2222 for SSH with default users and passwords, please be careful
where and when you run it. It is meant to be used behind an intranet by trusted participants, and
stopped (`vagrant halt`) once the workshop is finished.

## Requirements

* You need to have [VirtualBox](https://www.virtualbox.org/) and
  [Vagrant](https://www.vagrantup.com/) installed.

## Installation

* Clone this repository: `git clone https://github.com/hilverd/shared-terminal-workshops.git`

* In the directory `shared-terminal-workshops`, run `./present.sh`. This will take a while to run
  initially, as it involves downloading an Ubuntu base box for Vagrant and Ubuntu images for Docker.

## Usage

* To start a presentation session, the presenter runs `./present.sh`. Once the VM is configured and
  running, a `tmux` session is started in which every logged in participant gets a window. Use the
  Page Up and Page Down keys to navigate between windows.

* Each participant connects to the VM using `ssh -p 2222 <user>@<host-ip>`. By default, the users
  `alice` and `bob` are available with password `vagrant`. To find out `<host-ip>`, see the output
  of `ifconfig` (or on Linux use `hostname -I`).

* To end the workshop, the presenter presses Control-B Control-D to detach from the `tmux` session
  and then runs `vagrant halt` to stop the VM.

![Screenshot](img/screenshot.jpg?raw=true "Screenshot")

## Configuration

* The user names and passwords of participants are configured in
  `puppet/modules/accounts/manifests/init.pp`.

* The exercises can be found at `puppet/modules/sandbox/files/exercises-sandbox/exercises`.

* The Docker container used for each participant's session is based on
  `puppet/modules/sandbox/files/exercises-sandbox/Dockerfile`.

## Troubleshooting

If there are problems with timeouts (e.g. "unexpected EOF") during the initial setup then run
`vagrant reload --provision` to try again.
