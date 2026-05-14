# Shield Tablet K1 Tweaks — Magisk Module

Complement module for [YAKT](https://github.com/NotZeetaa/YAKT) on the **NVIDIA SHIELD Tablet K1** (Tegra K1, ARMv7, Android 8.1).

## What it does

| Parameter | Value | Effect |
|---|---|---|
| I/O scheduler | `deadline` | More responsive than default `cfq` |
| `dirty_background_ratio` | `5%` | Background writeback starts earlier, avoiding burst writes |
| `dirty_expire_centisecs` | `500` | Dirty pages written sooner |
| `hispeed_freq` | `564 MHz` | CPU ramps up at this frequency under load |
| `target_loads` | `85%` | Scale up CPU before hitting full load |
| `above_hispeed_delay` | `20ms` | Delay before going above hispeed |
| `timer_rate` | `80ms` | Governor sampling rate |
| `min_sample_time` | `40ms` | Minimum time at current frequency before scaling down |
| `io_is_busy` | `1` | Count I/O wait as CPU busy for better storage responsiveness |

## Requirements

- NVIDIA SHIELD Tablet K1 (shieldtablet)
- Android 8.1 (Lineage 15.1 or stock)
- Magisk 20+
- [YAKT v17](https://github.com/NotZeetaa/YAKT) installed (runs after it)

## Installation

1. Download the zip from [Releases](../../releases)
2. Flash via Magisk Manager
3. Reboot

## Notes

- The module sleeps 90 seconds on boot to run **after** YAKT finishes
- Does not modify `swappiness` to avoid conflict with YAKT
- `deadline` scheduler persists across reboots
- Tested on SHIELD Tablet K1 with Magisk 30.7 and YAKT v17

## Device specs

- SoC: NVIDIA Tegra K1 (quad-core ARMv7 @ 2.2GHz)
- RAM: 2GB
- Storage: 16GB eMMC
- Android: 8.1.0
- Kernel: 3.10.96+
