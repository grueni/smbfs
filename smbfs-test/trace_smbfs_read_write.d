#pragma D option flowindent
/*
 * print stack trace when entrining
 * smbfs_write
 */
fbt:smbfs:smbfs_write:entry
{
    stack();
}
fbt:smbfs:smbfs_read:entry
{
    stack();
}
