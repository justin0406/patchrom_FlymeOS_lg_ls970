#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9863168 a0bca51732ce0f0eddcb14fb5f50829b77fcf6b9 7354368 f7bfbf22efb6cb86ef8f3bd88ee736fe21b80cf8
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9863168:a0bca51732ce0f0eddcb14fb5f50829b77fcf6b9; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7354368:f7bfbf22efb6cb86ef8f3bd88ee736fe21b80cf8 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a0bca51732ce0f0eddcb14fb5f50829b77fcf6b9 9863168 f7bfbf22efb6cb86ef8f3bd88ee736fe21b80cf8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
