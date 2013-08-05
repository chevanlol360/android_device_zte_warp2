## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := warp2

# Inherit device configuration
$(call inherit-product, device/zte/warp2/full_warp2.mk)

# Inherit some common Carbon stuff.
$(call inherit-product, vendor/carbon/config/common_phone.mk)

# Inherit some common CDMA stuff.
$(call inherit-product, vendor/carbon/config/common_cdma.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := warp2
PRODUCT_NAME := carbon_warp2
PRODUCT_BRAND := zte
PRODUCT_MODEL := warp2
PRODUCT_MANUFACTURER := zte
