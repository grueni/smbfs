#pragma D option flowindent
/*
 * Trace nsmb filesystem functions.
 * Usage: sudo dtrace -s trace_calls.d
 */
fbt:nsmb::entry
{
    @[probefunc] = count();
    printf("e");

}

fbt:nsmb::return
{
   printf("ret=%d", arg1);  
}
