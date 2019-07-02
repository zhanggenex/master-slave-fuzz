#!/bin/bash
time="$1"

log-debug() {
    echo -e "\e[94m[*]\e[0m $*"
}

print-args()
{
    [[ "$#" -le 2 ]] && return
    log-debug "$1"
    for arg in "${@:2}"; do
        log-debug "\t$arg"
    done
}

args=("../afl-fuzz" "-m 20981520" "-t 1000" "-i" "seed" "-o" "out" "-M" "master" "$2" "$3" "@@" "$4")
print-args "AFL cmdline:" "${args[@]}"
nohup timeout $time "${args[@]}" > master.log  &

args=("../afl-fuzz" "-m 20981520" "-t 1000" "-i" "seed" "-o" "out" "-S" "fuzzer1" "$2" "$3" "@@" "$4")
print-args "AFL cmdline:" "${args[@]}"
nohup timeout $time "${args[@]}" > fuzzer1.log  &

args=("../afl-fuzz" "-m 20981520" "-t 1000" "-i" "seed" "-o" "out" "-S" "fuzzer2" "$2" "$3" "@@" "$4")
print-args "AFL cmdline:" "${args[@]}"
nohup timeout $time "${args[@]}" > fuzzer2.log  &

args=("../afl-fuzz" "-m 20981520" "-t 1000" "-i" "seed" "-o" "out" "-S" "fuzzer3" "$2" "$3" "@@" "$4")
print-args "AFL cmdline:" "${args[@]}"
nohup timeout $time "${args[@]}" > fuzzer3.log  &

args=("../afl-fuzz" "-m 20981520" "-t 1000" "-i" "seed" "-o" "out" "-S" "fuzzer4" "$2" "$3" "@@" "$4")
print-args "AFL cmdline:" "${args[@]}"
nohup timeout $time "${args[@]}" > fuzzer4.log

