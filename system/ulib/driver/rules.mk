# Copyright 2016 The Fuchsia Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_DIR := system/uapp/devmgr

MODULE := system/ulib/driver

MODULE_NAME := driver

MODULE_TYPE := userlib

MODULE_DEFINES += LIBDRIVER=1

MODULE_SRCS := \
	$(LOCAL_DIR)/devmgr.c \
	$(LOCAL_DIR)/devhost.c \
	$(LOCAL_DIR)/binding.c \
	$(LOCAL_DIR)/rpc-device.c \
	$(LOCAL_DIR)/api.c \
	$(LOCAL_DIR)/main.c \

ifeq ($(WITH_DEV_PCIE),1)
MODULE_SRCS := \
	system/udev/kpci/kpci.c \
	system/udev/kpci/protocol.c \

endif


MODULE_HEADER_DEPS := ulib/ddk

MODULE_DEPS := ulib/musl ulib/mxio ulib/runtime ulib/magenta

MODULE_EXPORT := driver

include make/module.mk
