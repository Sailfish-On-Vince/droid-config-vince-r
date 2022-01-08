# These and other macros are documented in
# ../droid-configs-device/droid-configs.inc
%define device vince
%define vendor xiaomi
%define vendor_pretty Xiaomi
%define device_pretty Redmi 5 Plus
%define rpm_device vince
%define dcd_path ./
# Adjust this for your device
%define pixel_ratio 1.5
# We assume most devices will
%define have_modem 1
%define android_version_major 11

# Device-specific usb-moded configuration
Provides: usb-moded-configs

# Device-specific ofono configuration
Provides: ofono-configs
Obsoletes: ofono-configs-mer

Obsoletes: qt5-qpa-surfaceflinger-plugin

# Community HW adaptations need this
%define community_adaptation 1

# For bluez5
%define ofono_enable_plugins bluez5,hfp_ag_bluez5
%define ofono_disable_plugins bluez4,dun_gw_bluez4,hfp_ag_bluez4,hfp_bluez4,dun_gw_bluez5,hfp_bluez5

%include droid-configs-device/droid-configs.inc
%include patterns/patterns-sailfish-device-adaptation-vince.inc
%include patterns/patterns-sailfish-device-configuration-vince.inc
