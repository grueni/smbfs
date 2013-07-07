#pragma D option flowindent
/*
 * Trace smbfs filesystem functions.
 * Usage: sudo dtrace -s trace_calls.d
 */
fbt:smbfs::entry
{
    printf(" ");
}

fbt:smbfs::return
{
   printf("= %d", arg1);  
}
