
##############################################################
#
# ldd
#
##############################################################
#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 5a7423a0415ab3d850e94c55c865cf51dc847244
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-adna4700.git
LDD_METHOD = git
LDD_GIT_SUBMODULES = YES

#supports building and installing the misc-modules and scull components into the root filesystem.
LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/ 

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS

	
	
	$(INSTALL) -m 0755 $(@D)/misc-modules/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)scull/* $(TARGET_DIR)/usr/bin

	
endef

$(eval $(kernel-module))
$(eval $(generic-package))
