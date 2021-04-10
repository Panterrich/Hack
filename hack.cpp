#include <stdio.h>

// 151 119

int main()
{
    FILE* file = fopen("file.txt", "w");

    // for (size_t i = 0; i < 1488; i++)
    //     fprintf(file, "%c", 1);
    // fprintf(file, "%c", 228);


    for (size_t i = 0x01DB; i != 0x17F; i--)
    {
        fprintf(file, "\b");
    }

    fprintf(file, "%c", 0);
    
    for (size_t i = 0x0180; i != 0x168; i--)
    {
         fprintf(file, "\b");
    }

    fprintf(file, "%c%c", 0x17, 0x0D);
   
    fclose(file);



















    // char mass[1000] = {};

    // int byte = 0x01DB;
    // int pos  = 0;

    // for (byte; byte != 0x17F; byte--)
    // {
    //     mass[pos] = '\b';
    //     pos++;
    // }

    // mass[pos] = 0x00;
    // pos++;
    // byte++;

    // for (byte; byte != 0x168; byte--)
    // {
    //     mass[pos] = '\b';
    //     pos++;
    // }

    // mass[pos] = 0x17;
    // pos++;
    // mass[pos] = 0x0D;
    // pos++;

    // fwrite(mass, sizeof(char), 1000, file);


    return 0;
}