#pragma D option flowindent
/*
 * Trace nsmb filesystem functions.
 * Usage: sudo dtrace -s trace_calls.d
 */
fbt:nsmb::entry
{
    printf(" ");
}

fbt:nsmb:smb_rwuio:entry 
{
   printf("fid=%d", arg1);
}

fbt:nsmb::return
{
   printf("= %d", arg1);  
}
