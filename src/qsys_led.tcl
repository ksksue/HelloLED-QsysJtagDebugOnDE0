####################################################
# Open
####################################################
puts stdout "Open Device"
set mm [lindex [get_service_paths master] 0]
open_service master $mm

####################################################
# LED�փ`�F�b�N�p�^�[����������
####################################################
puts stdout ""
puts stdout "check pattern LED"

#master_write_32 $mm 0x00000000 0x555

master_write_32 $mm 0x00000000 0xAAA
