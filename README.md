# Dotfiles

Contains dotfiles of my Arch GNOME setup. Comes with an install script to do the setup. Be careful, it creates symlinks and overwrites the currently existing files.

Some key remarks about this setup:
- It uses BTRFS and snapper with automatic snapshots on pacman transactions

___screenshots coming soon (TM)___

## Zsh

The combination of oh my zsh and fzf enable a very easy and efficient usage of the terminal. Depending on the package manager the keybindings may not work out of the box. In this case go to the repo of fzf and copy the keybindings script manually.

### Required software

- zsh
- oh my Zsh!
- fzf

## Neovim

- onedark theme with lightline
- intellisense for svelte, angular and other languages I need often
  - coc
  - polyglot
  - easy commenting even in svelte with nerdcommenter and context-filetype
- efficiency improvements
  - sneak
  - auto pair brackets
  - surround
  - git integration
  - fzf

### Required software

- neovim
- node.js + npm (for coc)
- fzf

## KDE

All `.kksrc` files contain shortcuts which have to be imported via the manjaro shortcut settings manager.

The kwin shortcuts are changed to make switching between windows and desktops more vim-like because I like consistency in my keyboard commands.

### Konsole

Configurations for a profile with colors and preferences like default shell. Because of a bug in Konsole the nerdicons in the coc-explorer are broken. For now I removed them as workaround.

## Setup from scratch with snapshots, BTRFS, Gnome, ...

The setup will work for a system with a german keyboard and EN language. It will show how the installation for BTRFS with snapshots with snapper and the Gnome desktop works. A lot of this is from [this](https://youtu.be/Xynotc9BKe8) guide on YouTube.

Directly when running the ISO:

- use german keyboard layout with `loadkeys de-latin1`
- check internet connection with `ip a`
- setup date and time `timedatectl set-ntp true`
- setup mirrorlist with reflector `reflector -c Germany -a 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist`
- update mirrors `pacman -Syy`
- setup partitions
    - check devices and partitions with `lsblk`
    - open gdisk tool with the device the system should be installed on `gdisk /dev/sda`
    - current partition table can be cleared with `o`
    - EFI partition: `n` for new partition and `+300M` for 300Mb size `ef00` to make it a efi system partition type
    - swap partition: `n`, `+4G`, `8200`
    - main partition: `n` and then only enter to use the rest of the disk and use default ext4 file type
    - write the partitions to the disk with `w` and confirm with `y`
    - create fat32 filesystem for EFI partition with `mkfs.fat -F32 /dev/sda1`
    - create swapspace with `mkswap /dev/sda2` and activate it with `swapon /dev/sda2`
    - create btrfs main filesystem with `mkfs.btrfs /dev/sda3`
    - mount main filesystem to the installation directory `mount /dev/sda3 /mnt`
    - setup root subvolume for btrfs `btrfs subvolume create /mnt/@`
    - setup home subvolume for btrfs `btrfs subvolume create /mnt/@home`
    - setup snapshots subvolume for btrfs `btrfs subvolume create /mnt/@snapshots`
    - setup var log subvolume for btrfs `btrfs subvolume create /mnt/@var_log`
    - unmount the directory to create the directories the subvolumes shoud be mounted to with `umount /mnt`
    - mount root subvol again with options `mount -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/sda3 /mnt`
    - create directories for other subvolumes `mkdir -p /mnt/{boot,home,.snapshots}` and `mkdir -p /mnt/var/log`
    - mount home subvol `mount -o noatime,compress=lzo,space_cache=v2,subvol=@home /dev/sda3 /mnt/home`
    - mount snapshots subvol `mount -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots /dev/sda3 /mnt/.snapshots`
    - mount var log subvol `mount -o noatime,compress=lzo,space_cache=v2,subvol=@var_log /dev/sda3 /mnt/var/log`
    - mout boot partition `mount /dev/sda1 /mnt/boot`
    - check mounts with `lsblk`
    - strap packages `pacstrap /mnt base linux linux-firmware vim intel-ucode` (swap intel for amd when you have a amd processor)
    - set fstab with `genfstab -U /mnt >> /mnt/etc/fstab`
- enter installation directoy with `arch-chroot /mnt`
- setup timezone `ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime`
- sync clocks `hwclock --systohc`
- open /etc/locale.gen file and comment out the desired language (use UTF-8)
- generate locales with `locale-gen`
- put locale in /etc/locale.conf file with a editor, content should look like this: `LANG=en_US.UTF-8`
- put keyboard layout int /etc/vconsole.conf file: `KEYMAP=de-latin1`
- put hostname in /etc/hostname file
- put hosts in /etc/hosts like:
    ```
       127.0.0.1          localhost
       ::1                localhost
       127.0.1.1          [your hostname].localdomain     [your hostname]
    ```
- set password for root user with `passwd`
- install some more packages `pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools git reflector snapper xdg-utils xdg-user-dirs alsa-utils pulseaudio inetutils base-devel linux-headers`. accept defaults and install
- load btrfs as a module before boot by adding "btrfs" to the modules in `/etc/mkinitcpio.conf`
- re-generate the kernel image wiht `mkinitcpio -p linux`
- install grub for EFI systems with `grub-install --target=x86_64-efi --efi-direcotry=/boot --bootloader-id=GRUB`
- make grub config with `grub-mkconfig -o /boot/grub/grub.cfg`
- enable networkmanager service with `systemctl enable NetworkManager`
- setup a user
  - create user with `useradd -mG wheel jgero` to be able to make him a sudoer later
  - give the user a password with `passwd jgero`
  - update visudo file with vim: `EDITOR=vim visudo`, uncomment the line to enable all users in the wheel group to be allowed everything (`%wheel ALL=(ALL) ALL`)
- exit the shell in the installation dir
- unmount all everything in the iso with `umount -a`
- reboot with `reboot`
- login as the non-root user
- setup snapper (from ArchWiki)
  - unmpunt snapshots directory with `sudo unmount /.snapshots`
  - delete snapshots directory with `sudo rm -r /.snapshots`
  - create snapper config for the root directory: `sudo snapper -c root create-config /`
  - detete the automatically created snapshots subvolume because we already created one previously: `sudo btrfs subvolume delete /.snapshots`
  - re-create snapshots dir with `sudo mkdir /.snapshots`
  - re-add permissions for current user with `sudo chmod a+rx /.snapshots` and add group `sudo chown :jgero /.snapshots`
  - re-mount the subvol with config from the fstab: `sudo mount -a`
  - change permissions of snapshots directory; this is needed to make replacing the root subvolume easier: `sudo chmod 750 /.snapshots`
  - change some snapper config by editing the previously created config file:
    - open config file with `sudo vim /etc/snapper/configs/root`
    - add user to "ALLOW-USERS"
    - change snapshot to more sane settings like [specified here](https://wiki.archlinux.org/index.php/Snapper#Set_snapshot_limits)
  - enable snapper timeline and cleanup to start cleanups: `sudo systemctl enable --now snapper-timeline.timer` and `sudo systemctl enable --now snapper-cleanup.timer`
- install snap-pac `sudo pacman -S snap-pac` to create snapshots automatically on pacman transactions
- read in the arch wiki whether you should install a graphics driver (look [here](https://wiki.archlinux.org/index.php/Intel_graphics) for intel)
- install GNOME and GNOME-Tweaks as desktop with `sudo pacman -S gnome gnome-tweaks`
- enable GDM so systems boots into gui on next reboot: `systemctl enable gdm`
- now you can reboot and should land in the gnome desktop

## TODO

- some kind of vim-startpage to avoid netrw when opening nvim on a directory

