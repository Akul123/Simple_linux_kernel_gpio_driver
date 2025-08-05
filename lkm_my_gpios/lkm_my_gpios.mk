LKM_MY_GPIOS= lkm_my_gpios
LKM_MY_GPIOS_VERSION = 1.0
LKM_MY_GPIOS_SITE = $(BR2_EXTERNAL_kernel_package_PATH)/packages/$(LKM_MY_GPIOS)
LKM_MY_GPIOS_SITE_METHOD = local

LKM_MY_GPIOS_MAKE_OPTS = \
    ARCH=$(KERNEL_ARCH) \
    CROSS_COMPILE=$(TARGET_CROSS) \
    -C $(LINUX_DIR) \
    M=$(BUILD_DIR)/$(LKM_MY_GPIOS)-$(LKM_MY_GPIOS_VERSION) \
    modules

define LKM_MY_GPIOS_BUILD_CMDS
    $(MAKE) $(LKM_MY_GPIOS_MAKE_OPTS)
endef

define LKM_MY_GPIOS_INSTALL_TARGET_CMDS
    $(MAKE) $(LKM_MY_GPIOS_MAKE_OPTS) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef

$(eval $(kernel-module))
$(eval $(generic-package))