# These and other macros are documented in
# ../droid-configs-device/droid-configs.inc
%define device vince
%define vendor xiaomi
%define vendor_pretty Xiaomi
%define device_pretty Redmi 5 Plus (vince)
%define dcd_path ./
# Adjust this for your device
%define pixel_ratio 2.0
# We assume most devices will
%define have_modem 1

Provides: ofono-configs

# Community HW adaptations need this
%define community_adaptation 1

%define ofono_enable_plugins hfp_ag_bluez5

%include droid-configs-device/droid-configs.inc
