disk=$1
if [[ ! $disk ]]; then
	echo "specify disk!"
	return
fi
parted /dev/"$disk" -- mklabel gpt
parted /dev/"$disk" -- mkpart root ext4 512MB -8GB
parted /dev/"$disk" -- mkpart swap linux-swap -8GB 100%
parted /dev/"$disk" -- mkpart ESP fat32 1MB 512MB
parted /dev/"$disk" -- set 3 esp on

mkfs.ext4 -L nixos /dev/"$disk"1
mkswap -L swap /dev/"$disk"2
mkfs.fat -F 32 -n boot /dev/"$disk"3

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
swapon /dev/"$disk"2
nixos-generate-config --root /mnt
