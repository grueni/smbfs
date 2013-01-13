#pragma D option flowindent
/*
 * Trace smbfs filesystem functions.
 * Usage: sudo dtrace -s trace_calls.d
 */
fbt:smbfs::entry
{
    @[probefunc] = count();
    printf("tid=%d", tid);    

}

fbt:smbfs::return
{
   printf("tid=%d", tid);  
}
