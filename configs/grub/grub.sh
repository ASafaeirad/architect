#! /bin/sh
# hide menu
echo 'GRUB_FORCE_HIDDEN_MENU="true"\n' >> /etc/default/grub

# show menu by holding shift key on boot time
cp "$(dirname "$BASH_SOURCE")"/31_hold_shift /etc/grub.d/
chmod a+x /etc/grub.d/31_hold_shift
grub-mkconfig -o /boot/grub/grub.cfg
