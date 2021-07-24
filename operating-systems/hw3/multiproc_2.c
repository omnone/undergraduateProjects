#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <stdio.h>
#include <stdlib.h>
#include "util.h"

int main(int argc, char *argv[])
{

  
  struct sembuf up = {0, 1, 0};
  struct sembuf down = {0, -1, 0};
  int  v1;

  int my_sem = semget(IPC_PRIVATE, 1, 0600);
  int rep = atoi(argv[1]);

  v1 = semctl(my_sem, 0, GETVAL);
  //printf("value sem: %d\n", v1);
  int i;

  for (i = 2 ; i < argc  ; i++) {
    v1 = semctl(my_sem, 0, GETVAL);
    int pid = fork();

    if (pid == 0) {
      v1 = semctl(my_sem, 0, GETVAL);
      //printf("child: %d\n", v1);

      semop(my_sem, &down, 1);//{
      init();

      semop(my_sem,&up,1);//}

      semop(my_sem, &down, 1);


     for (int j = 0 ; j < rep ; j++){
        display(argv[i]);
     }

      v1 = semctl(my_sem, 0, GETVAL);

      //printf("value sem: %d\n", v1);
      semop(my_sem, &up, 1);
      exit(0);


    }
    else if (pid < 0) {
      display("fork failed");
      exit(0);
    }

  }

  v1 = semctl(my_sem, 0, GETVAL);
  int status;

  semop(my_sem, &up, 1);
  for (i = 2; i < argc; ++i) {
    wait(&status);
  }

  v1 = semctl(my_sem, 0, IPC_RMID);
  return 0;

}