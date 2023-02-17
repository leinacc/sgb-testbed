#!/usr/bin/env python3

import sys

args = len(sys.argv)
assert args > 1, "Pass in the starting address"
assert args == 2, "Too many arguments passed to this script"

start_addr = int(sys.argv[1], 16)
with open('main.bin', 'rb') as f:
    cmd_data = f.read()

cmd_len = len(cmd_data)
assert cmd_len > 0, "Input file is empty"

i = 0
max_param_len = 0xb
while i < cmd_len:
    packet_params = cmd_data[i:i+max_param_len]
    packet_bytes = [
        start_addr&0xff, (start_addr>>8)&0xff, start_addr>>16,
        len(packet_params),
        *packet_params, 
    ]
    stringified = ",".join(f"${b:02x}" for b in packet_bytes)
    print(f'sgb_packet DATA_SND, 1, {stringified}')
    i += max_param_len
    start_addr += max_param_len
