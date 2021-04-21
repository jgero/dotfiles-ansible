# Dotfiles

Dotfiles for my Fedora workstation setup. They include the most important configurations of the tools I use all the time.

- bash scripts for supplementary environment vairables and convenience
- config for my neovim setup
- systemd services
  - restic backup service

## setup

An installation script is provided in the repo to restore all dotfiles. Be careful, the script may override or delete some of the already exiting configurations in the system. It is important to run this script as your normal user, because it sets up systemd user services.

1. clone repo anywhere on your system
2. run `sh setup.sh`
3. if necesary change the name and mail to your personal stuff instead of mine

## bash

On Fedora just running the install script will get everything working. 

```bash
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
```

## systemd services

To not disturb the service onece it's running the files are copied insted of linked to the `.config` dir. The services will not be started directly because some additional setup is needed beforehand.

### restic

This setup is more or less a combination of [an article in the fedora magazine](https://fedoramagazine.org/automate-backups-with-restic-and-systemd/) and [this post](https://askubuntu.com/questions/25071/how-to-run-a-script-when-a-specific-flash-drive-is-mounted). One service syncs everyting to a online repository once per day, triggered by a timer, and the other service syncs to a USB hard drive, triggered by mounting of that specific drive to the system.

To setup backups, a password and repository has to be specified. You have to init the repository before starting the service and add the `~/.config/systemd/user/restic-creds.env` file which has to look like this:

```
RESTIC_PASSWORD="xxxxx"
RESTIC_REPOSITORY="xxxxx"
```

Two of these credential files are needed, one for the remote repositry and one on the hard drive.

Before starting the services reload systemd: `systemctl --user daemon-reload`.
These services for the remote repo are oneshots and can be run manually to test if they work: `systemctl --user start restic-backup` or `systemctl --user start restic-prune`.

After symlinking the files to your config and setting up your credential file you can run `systemctl --user enable --now restic-backup.timer` and `systemctl --user enable --now restic-prune.timer` to start the automatic backups.

