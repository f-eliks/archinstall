echo $(ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime)
echo $(hwclock --systohc)
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
echo $(locale-gen)
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de-latin1" >> /etc/vconsole.conf
echo "diplodocus" >> /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	diplodocus.localdomain	diplodocus" >> /etc/hosts
echo $(mkinitcpio -P)
echo $(/boot/grub/grub-mkconfig > /boot/grub/grub.cfg)
echo $(grub-install /dev/sda2)
echo "\n ready"
