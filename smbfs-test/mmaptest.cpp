#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <sys/errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <dirent.h>
#include <errno.h>
#include <strings.h>
#include <unistd.h>
#include <sys/param.h>
#include <unistd.h>
#include <ctype.h>

using namespace std;

int
main (int argc, char * argv[])
{
    char *path = argv[1];
    size_t size = atoi(argv[2]);
    size_t i;
    uchar_t *buf, *map;
    int fd;

    buf = (uchar_t *)malloc(size);
    if (buf == NULL) {
        cout << "\t\tdoMmap: malloc(): " << strerror(errno) << endl;
        return(errno);
    }

    // 10101010
    memset(buf, 0xaa, size);
 
    fd = open64(path, O_RDWR|O_CREAT, 0644);    
    if (fd < 0) {
        cout << "\t\tdoMmap: open(" << path << "): " << strerror(errno) << endl;
        free(buf);        
        return(errno);
    }

    if (write(fd, (void *)buf, size) < 0) {
        cout << "\t\tdoMmape: write(" << path << "): " << strerror(errno) << endl;
        free(buf);        
        return(errno);
    }
    
    map = (uchar_t *)mmap(0, size, PROT_READ, MAP_PRIVATE, fd, 0);

    close(fd);
    
    if (map == (uchar_t *)-1) {
        cout << "\t\tdoMmap: mmap(" << path << "): " << strerror(errno) << endl;
        free(buf);        
        return(errno);
    }

    cout << "sleeping" << endl;

    sleep(10);

    free(buf);    
    cout << "\t\tdoMmap: success." << endl;
    return (0);

}
