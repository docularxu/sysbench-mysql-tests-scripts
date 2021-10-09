#/bin/bash

set -x
#  CMDLINE='iommu.passthrough=1 arm_smmu_v3.disable_msipolling=1 root=/dev/sda1 rw ip=dhcp module_blacklist=nf_conntrack,ip_tables,x_tables'

CMDLINE='iommu.passthrough=1 arm_smmu_v3.disable_msipolling=1 root=/dev/sda1 rw ip=dhcp'

IMAGE3='./Image-v5.14-rc1-3patch'
IMAGE6='./Image-v5.14-rc1-6patch'
IMAGE7='./Image-v5.14-rc1-7patch'
IMAGE12='./Image-v5.14-rc1-0012'

IMAGE=${IMAGE:-'./Image-v5.14-rc1-0012'}

kexec -l ${IMAGE} --append="${CMDLINE}"
kexec -e
