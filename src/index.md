% bpftrace

High-level tracing language for Linux systems

[Documentation](./docs/v0.21.x.html)

[Tutorial](https://github.com/bpftrace/bpftrace/blob/master/docs/tutorial_one_liners.md)

[Community forum](https://github.com/bpftrace/bpftrace/discussions)

[Bug tracker](https://github.com/bpftrace/bpftrace/issues)

[IRC](http://irc.lc/oftc/bpftrace/web@@@)

[Github](https://github.com/bpftrace/bpftrace/)

### Example

Produce a histogram of time (in nanoseconds) spent in `read(2)`:
```
 // read.bt file
 tracepoint:syscalls:sys_enter_read
 {
   @start[tid] = nsecs;
 }
 
 tracepoint:syscalls:sys_exit_read / @start[tid] /
 {
   @times = hist(nsecs - @start[tid]);
   delete(@start[tid]);
 }
 
 # bpftrace read.bt
 Attaching 2 probes...
 ^C
 
 @times:
 [256, 512)           326 |@                                                   |
 [512, 1k)           7715 |@@@@@@@@@@@@@@@@@@@@@@@@@@                          |
 [1k, 2k)           15306 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
 [2k, 4k)             609 |@@                                                  |
 [4k, 8k)             611 |@@                                                  |
 [8k, 16k)            438 |@                                                   |
 [16k, 32k)            59 |                                                    |
 [32k, 64k)            36 |                                                    |
 [64k, 128k)            5 |                                                    |
```
