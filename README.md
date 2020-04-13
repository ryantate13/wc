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
1000000

real	0m1.069s
user	0m0.050s
sys	0m0.032s

================
cpp
================
1000000

real	0m1.256s
user	0m0.045s
sys	0m0.036s

================
d
================
1000000

real	0m1.282s
user	0m0.038s
sys	0m0.044s

================
go
================
1000000

real	0m1.084s
user	0m0.055s
sys	0m0.028s

================
nim
================
1000000

real	0m1.310s
user	0m0.045s
sys	0m0.032s

================
node
================
1000000

real	0m1.228s
user	0m0.058s
sys	0m0.029s

================
php
================
1000000

real	0m3.509s
user	0m0.048s
sys	0m0.033s

================
python
================
1000000

real	0m4.857s
user	0m0.049s
sys	0m0.044s

================
rust
================
1000000

real	0m1.174s
user	0m0.033s
sys	0m0.047s
```

## View Generated Image Sizes

```bash
make images/ls
```

#### Outputs
```text
REPOSITORY              TAG                 IMAGE ID            CREATED                  SIZE
wc                      c                   d70f61d68ea3        16 seconds ago           159kB
wc                      cpp                 308fd662f031        15 seconds ago           7.04MB
wc                      d                   8b09ebe373ae        15 seconds ago           2.23MB
wc                      go                  a5dc07bd7861        14 seconds ago           2.09MB
wc                      nim                 5d7134a11877        14 seconds ago           253kB
wc                      node                bfb3d21b52c1        6 seconds ago            37.4MB
wc                      php                 2698660271c7        1 second ago             13.1MB
wc                      python              69a88afbaf02        1 second ago             25.5MB
wc                      rust                e2f35af40b2e        Less than a second ago   2.92MB
```