# wc

Count the words piped in from stdin. Basically equivalent to `wc -w`. Implemented in various languages with a Makefile set up to build each in to a docker container and gauge its performance.

## Building the Images

```bash
make images
```

## Build and Run

```bash
make images run
```

## Run Each Image and Output Total Time

```bash
make run

```

#### Outputs

```text
================
c
================

real    0m1.637s
user    0m0.113s
sys     0m0.089s

================
cpp
================

real    0m1.672s
user    0m0.137s
sys     0m0.117s

================
d
================

real    0m2.122s
user    0m0.168s
sys     0m0.113s

================
go
================

real    0m1.685s
user    0m0.112s
sys     0m0.069s

================
node
================

real    0m2.104s
user    0m0.145s
sys     0m0.129s

================
php
================

real    0m6.281s
user    0m0.115s
sys     0m0.101s

================
python
================

real    0m7.753s
user    0m0.158s
sys     0m0.120s

================
rust
================

real    0m1.815s
user    0m0.177s
sys     0m0.111s
```

## View Generated Image Sizes

```bash
make images/ls
```

#### Outputs
```text
REPOSITORY                    TAG                 IMAGE ID            CREATED                  SIZE
wc                            c                   1bcdbfc8e992        20 seconds ago           159kB
wc                            cpp                 929662cb93fb        19 seconds ago           7.04MB
wc                            d                   74352c9b9984        18 seconds ago           2.23MB
wc                            go                  b7f223d3b0ce        16 seconds ago           2.09MB
wc                            node                a6d729f01f11        9 seconds ago            32.9MB
wc                            php                 7c2e0ad5da28        4 seconds ago            13.1MB
wc                            python              6a916ad2ec4d        2 seconds ago            24.9MB
wc                            rust                1fd17297e00d        Less than a second ago   2.92MB
```