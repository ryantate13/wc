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
====================
c
====================

real	0m1.512s
user	0m0.144s
sys	0m0.104s

====================
cpp
====================

real	0m1.466s
user	0m0.101s
sys	0m0.071s

====================
d
====================

real	0m2.019s
user	0m0.147s
sys	0m0.093s

====================
go
====================

real	0m1.623s
user	0m0.124s
sys	0m0.105s

====================
node
====================

real	0m1.814s
user	0m0.173s
sys	0m0.090s

====================
php
====================

real	0m5.934s
user	0m0.143s
sys	0m0.124s

====================
python
====================

real	0m9.568s
user	0m0.150s
sys	0m0.104s

====================
rust
====================

real	0m1.620s
user	0m0.121s
sys	0m0.108s
```

## View Generated Image Sizes

```bash
make images/ls
```

#### Outputs

```text
REPOSITORY                    TAG                 IMAGE ID            CREATED                  SIZE
wc                            c                   7dfcdac271b2        30 seconds ago           159kB
wc                            cpp                 23e6bdd26d6e        28 seconds ago           7.04MB
wc                            d                   7b18b7d1fb87        28 seconds ago           2.23MB
wc                            go                  af2793bef73d        26 seconds ago           2.09MB
wc                            node                3239c46bb841        18 seconds ago           34.3MB
wc                            php                 cf3303a11285        13 seconds ago           13.1MB
wc                            python              fd45aa4f36fb        2 seconds ago            58.5MB
wc                            rust                a650f42e1223        Less than a second ago   2.92MB
```