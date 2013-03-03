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
   stack();
}

fbt:smbfs:smbfs_close:entry 
{
   stack();
}

fbt:smbfs:smbfs_getapage:entry 
{
   printf("off=%d, len =%d", arg1, arg2); 
}

fbt:nsmb::return
{
   printf("= %d", arg1);  
}

fbt:smbfs::entry
{
    printf(" ");

}

fbt:smbfs::return
{
   printf("= %d", arg1);  
}
