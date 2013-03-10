#pragma D option flowindent
/*
 * print stack trace when entrining
 * smbfs_getapage
 */
fbt:smbfs:smbfs_getapage:entry
{
    stack();
}
