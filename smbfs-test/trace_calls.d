#pragma D option flowindent
/*
 * Trace smbfs filesystem functions.
 * Usage: sudo dtrace -s trace_calls.d
 */
fbt:smbfs::entry
{
    printf(" ");	
    self->traceme = 1;
}

fbt:smbfs::return
/self->traceme/
{
   printf("= %d", arg1);  
   self->traceme = 0;
}
