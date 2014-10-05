#!/bin/sh
# 程序说明
# 实现番茄工作法的脚本
# 番茄工作法规则
# 规则一：一个番茄时间共30分钟，包括25分钟的工作时间和5分钟的休息时间。
#
# 规则二：一个番茄时间是不可分割的。
# 番茄工作法中，时间的的最小单位是一个番茄时间。
# 一个番茄时间不能被划分：不存在半个番茄时间或一刻钟的番茄时间这样的事情。
#
# 规则三：每四个番茄时间后，停止你的工作，
# 进行一次较长时间的休息，大约15到30分钟
#
# 规则四：完成一个任务，划掉一个
# 用法讲解：第一个番茄为30分钟，结束后自己选择是否继续
# 输入y/Y继续下一个番茄，输入其他命令退出
PATH=$PATH:~/bin
export PATH

yn="y"
while [ "$yn" == "y" -o "$yn" == "Y" ]
do
    echo "env DISPLAY=:0 feh img/eg_bulboff.gif" | at now+25 minutes
    echo "env DISPLAY=:0 feh img/eg_bulbon.gif"  | at now+30 minutes

    sleep 30m 
    read -p "Please input (y/Y) to move on: " yn
done

atq | cut -s -f 1 | xargs atrm
echo "have a rest"
