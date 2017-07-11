#!/bin/sh

VPS_ROOT=/opt/vps

if [ $# -ne 2 ]; then
	echo 'err: too few arguments.'
	echo '  ./create_virtual_instance.sh <container_name> <addr>'
	exit 1
fi

vps_dir=${VPS_ROOT}/$1

if [ -d ${vps_dir} ]; then
	echo "err: container '$1' is already exists."
	exit 1
fi

#################################################
echo "-> Create the virtual instnce's filesystem"
mkdir -p ${vps_dir} || exit 1
tar Jxpf ./base.txz -C ${vps_dir}

#######################################
echo "-> Create ${vps_dir}/etc/rc.conf"
cat <<_EOF > ${vps_dir}/etc/rc.conf
root_rw_mount=NO
hostname="$1"
_EOF

########################################
echo "-> Create ${vps_dir}/etc/rc.local"
cat <<_EOF > ${vps_dir}/etc/rc.local
ifconfig vps0 inet 192.168.98.$2 netmask 255.255.255.255 up
route add default -iface vps0
_EOF

#####################################
echo "-> Create /etc/vps/vps_$1.conf"
cat <<_EOF >> /etc/vps/vps_$1.conf
NAME   = '$1'
FSROOT = '${vps_dir}'
INIT   = '/sbin/init'
NETIF_0_ADDRESS = '192.168.98.$2'
_EOF

# show result
cat <<_EOF
 container name: $1
 address       : 192.168.98.$2
_EOF

# Copyright (c) 2015, @furandon_pig
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the
# distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
