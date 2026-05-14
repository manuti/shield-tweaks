#!/system/bin/sh
# Shield Tablet K1 complement tweaks for YAKT
# Runs 90s after boot to ensure YAKT has finished
sleep 90

IPATH=/sys/devices/system/cpu/cpufreq/interactive
VMPATH=/proc/sys/vm

# I/O scheduler: deadline is more responsive than cfq for interactive use
for dev in /sys/block/mmcblk*/queue/scheduler; do
    echo deadline > $dev 2>/dev/null
done

# VM tweaks: start background writeback earlier to avoid burst writes
echo 5   > $VMPATH/dirty_background_ratio
echo 500 > $VMPATH/dirty_expire_centisecs

# Interactive CPU governor tuning
# hispeed_freq: ramp up to 564MHz when load is high
# target_loads: keep CPU busy up to 85% before scaling up
# io_is_busy: count I/O wait as CPU busy (better responsiveness during storage access)
echo 564000 > $IPATH/hispeed_freq
echo 85     > $IPATH/target_loads
echo 20000  > $IPATH/above_hispeed_delay
echo 80000  > $IPATH/timer_rate
echo 40000  > $IPATH/min_sample_time
echo 1      > $IPATH/io_is_busy
