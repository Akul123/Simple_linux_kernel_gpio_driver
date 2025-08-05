#ifndef LKM_MY_GPIOS__H
#define LKM_MY_GPIOS__H

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/mod_devicetable.h>
#include <linux/of.h>
#include <linux/of_device.h>

struct gpio_dev_private_data {
	char label[20];
	struct gpio_desc *desc;
	int button_irq;
};

struct gpio_drv_private_data {
	int total_devices;
	struct class *class_gpio;
	struct device **dev;
};

MODULE_LICENSE("Dual MIT/GPL");
MODULE_AUTHOR("me");
MODULE_DESCRIPTION("platform device driver which handles 1 led and 1 button");

#endif //LKM_MY_GPIOS__H