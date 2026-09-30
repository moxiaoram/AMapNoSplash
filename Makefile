ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME = roothide
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AMapNoSplash
AMapNoSplash_FILES = Tweak.xm
AMapNoSplash_FRAMEWORKS = UIKit
AMapNoSplash_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
