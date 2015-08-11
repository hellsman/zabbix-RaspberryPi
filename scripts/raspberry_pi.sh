#!/usr/bin/env bash
# Скрипт мониторинга Raspberry Pi в Zabbix
#
# author: Alexey Shulik
# e-mail: me@hellsman.ru
# date: 10.08.2015

case "$1" in
    cpu_temp) #Определяем температуру CPU
        echo `cat /sys/class/thermal/thermal_zone0/temp | sed -e 's/\(..\)\(.*\)/\1.\2/'`
        ;;
    gpu_temp) #Определяем температуру GPU
        echo `/opt/vc/bin/vcgencmd measure_temp|cut -c6-9`
        ;;
    *)
        echo "Не правильный параметр!"
        echo "Допустимые параметры:"
        echo "cpu_temp      - Определение температуры процессора"
        echo "gpu_temp      - Определение температуры видеокарты"
        ;;
esac