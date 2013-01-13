#pragma D option flowindent
/*
 * Count smbfs filesystem functions.
 * Usage: sudo dtrace -s count_calls.d
 */ 
fbt:smbfs::
{
    @[probefunc] = count();
}

tick-5sec 
{
        printa(@[probevunc]);
}


