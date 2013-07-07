#pragma D option flowindent

fbt::smbfs_map:entry
{
    @[probefunc] = count();
}


fbt::smbfs_delmap:entry
{
    @[probefunc] = count();
}

tick-3sec 
{
        printa(@[probevunc]);
}


