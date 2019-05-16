#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>

int number = 666;
module_param(number, int, 0);

static int __init my_init(void) {
  printk (KERN_INFO "The module has been loaded with number: %p.\n", number);
  return 0;
}

static int __exit my_exit(void) {
  printk (KERN_INFO "The module has been unloaded.");
  return 0;
}

module_init (my_init);
module_exit (my_exit);

MODULE_AUTHOR ("Thomas van Leeuwen");
MODULE_LICENSE ("GPL v2");
