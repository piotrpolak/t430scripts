# Lenovo T430 scripts

A collection of scripts for Lenovo T430


### Undock event sequence

```
ibm/hotkey LEN0068:00 00000080 00004011
ac_adapter ACPI0003:00 00000080 00000000
ibm/hotkey LEN0068:00 00000080 00006030
thermal_zone LNXTHERM:00 00000081 00000000
```


### Dock event sequence

```
ibm/hotkey LEN0068:00 00000080 00004010
jack/headphone HEADPHONE plug
battery PNP0C0A:00 00000080 00000001
ac_adapter ACPI0003:00 00000080 00000001
ibm/hotkey LEN0068:00 00000080 00006030
thermal_zone LNXTHERM:00 00000081 00000000
```


Remember to add the following line to `~/.bashrc`
```
xhost local:$USER > /dev/null
```

```
xrandr --output VGA-0 --auto && \
xrandr --output LVDS-1-1 --off
```
