#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <sys/stat.h>
#include <pthread.h>
#include "util.h"

pthread_mutex_t lock;
pthread_cond_t cond1, cond2;


struct thread_args {
  int reps;
  char *string;
};


void *print_function(void *input) {
  int i = 0;
  struct thread_args *args = input;
  //pthread_mutex_lock(&lock);

  //for (int i = 0 ; i < args-> reps ; i++) {
  while (i < args-> reps) {
    pthread_mutex_lock(&lock);
    display(args -> string);
    i++;
    pthread_mutex_unlock(&lock);


  }
  //}

  //pthread_mutex_unlock(&lock);

  pthread_exit(NULL);


}



int main(int argc, char *argv[])
{

  int reps = atoi(argv[1]);
  int num_of_threads = argc - 2;

  pthread_mutex_init(&lock, NULL);
  pthread_t threads1[num_of_threads];

  int i;
  int string_topass = 2;

  struct thread_args *input_args;

  for (i = 0; i < num_of_threads; ++i) {


    input_args = malloc(sizeof(struct thread_args));

    (*input_args).reps = reps;
    (*input_args).string = argv[string_topass];
    string_topass++;

    if (pthread_create(&threads1[i] , NULL, print_function, (void *)input_args)) {
      printf("Error creating thread\n");
      exit(1);

    }

  }


  for (int j = 0; j < num_of_threads ; ++j)
  {
    pthread_join( threads1[j], NULL);

  }


  pthread_mutex_destroy(&lock);
  return 0;
}
