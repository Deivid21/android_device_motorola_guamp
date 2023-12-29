#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/guamp

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := guamp

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
ODM_MANIFEST_SKUS += b bc d dc dn dnc f fc n nc
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_BC_FILES := $(DEVICE_PATH)/sku/manifest_bc.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml
ODM_MANIFEST_DC_FILES := $(DEVICE_PATH)/sku/manifest_dc.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_DNC_FILES := $(DEVICE_PATH)/sku/manifest_dnc.xml
ODM_MANIFEST_F_FILES := $(DEVICE_PATH)/sku/manifest_f.xml
ODM_MANIFEST_FC_FILES := $(DEVICE_PATH)/sku/manifest_fc.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml
ODM_MANIFEST_NC_FILES := $(DEVICE_PATH)/sku/manifest_nc.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
TARGET_KERNEL_CONFIG += vendor/ext_config/guamp-default.config

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 50616843776

BOARD_SUPER_PARTITION_SIZE := 9763291136
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 4877451264 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 43

# Security patch level
VENDOR_SECURITY_PATCH := 2022-09-01

# Verified Boot
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH ?= external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM ?= SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Inherit from the proprietary version
include vendor/motorola/guamp/BoardConfigVendor.mk
