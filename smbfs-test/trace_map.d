#pragma D option flowindent
/*
 * Trace smbfs map related fuctions
 * Usage: sudo dtrace -s trace_map.d
 */
fbt:smbfs:smbfs_map:entry
{
    @[probefunc] = count();
    printf("tid=%d", tid);    
}

fbt:smbfs:smbfs_addmap:entry
{
    @[probefunc] = count();
    printf("tid=%d", tid);    
}

fbt:smbfs:smbfs_delmap:entry
{
    @[probefunc] = count();
    printf("tid=%d", tid);    
}

fbt:smbfs:smbfs_map:return
{
   printf("tid=%d", tid);  
}

fbt:smbfs:smbfs_addmap:return
{
   printf("tid=%d", tid);  
}

fbt:smbfs:delmap:return
{
   printf("tid=%d", tid);  
}
