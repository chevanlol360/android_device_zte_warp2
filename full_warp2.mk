PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)

#if we do this after the full_base_telephony is included some of these don't get picked up..
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cdma_warp2

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/zte/warp2/device_warp2.mk)

# Screen density is actually considered a locale (since it is taken into account
# the the build-time selection of resources). The product definitions including
# this file must pay attention to the fact that the first entry in the final
# PRODUCT_LOCALES expansion must not be a density.
PRODUCT_LOCALES += hdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_warp2
PRODUCT_DEVICE := warp2
PRODUCT_BRAND := BoostMobile
PRODUCT_MODEL := N861
PROUDCT_MANUFACTURER := ZTE
