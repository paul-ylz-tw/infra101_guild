# Infrastructure 101 Guild - Week 1 - Solution
Team: Tania, Darryl, Paul

## Vagrant environment
Start with:
```
vagrant up
```

We used lots of `vagrant reload --provision` to get a quicker (albeit not a clean slate) feedback cycle while developing the shell script.

## Volumes
Any files placed in the same directory as `Vagrantfile` are automatically mounted inside the guest at `/vagrant`.

## Logs
systemd logs are available for app service:

```
journalctl -u app
```

## Learnings

- A systemd error of `status=217/USER` indicates that the specified user did not exist when the service tried to start.

- Java source code in a jar file can be extracted to be read with `jar xf <jarfile>`. This would be required to inspect the application properties that the app would respond to.

- Overriding the default configuration file name passed to Spring is done with `--spring.config.name`.

- On OSX, to get a checksum of a file, use `shasum -a 256 <filename>`


## Rough Steps
How do we spin up a basic VM using vagrant? How do we copy the jar file in?

See Vagrantfile. We copy the jar file in using wget or Vagrant's file provisioner.

What dependencies are required to run the jar? How do we install them?
Java, apt-get

How do we automate that installation via shell scripts?
Using the shell provisioner and a script at `bootstrap.sh`

What user is running the jar? How do we make it more secure?
It was the root user, and we have created appuser to do it to make it more secure.

How can we run our app as a service? What are the benefits?
By using systemd. See app.service.
Benefits are automatic restarting when the machine is restarted or when the application process crashes.

How can we apply configuration to our app?

How can we automatically apply that configuration in a reproducible way using Ansible?

How can we automatically deliver configuration changes and ensure the app picks them up?

(extra) How can we package the resulting VM image for reuse using Packer?
