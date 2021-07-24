/*
   | Author: Konstantinos  Bourantas
   |
   | A.M:    6145
   |
   | Email:  bourantas@ceid.upatras.gr
   |
   | Computer Engineering & Informatics
   | Department, University of Patras
   |
   | 2016 - 2017
*/
///////////////////////////////////////////////////////////////////////////////////////////////////

#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

///////////////////////////////////////////////////////////////////////////////////////////////////
/* GLOBAL VARIABLES*/

#define BUFSIZE 1024
#define DELIMITERS " \t\r\n\a|"

int args_left, args_right;
int pipes_counter;
int total_cmds;
int input_numb[40];
int total_args = 0;


///////////////////////////////////////////////////////////////////////////////////////////////////


char **split_line(char *line)
{

  int bufsize = BUFSIZE;
  int i = 0;
  char **inputs_ar = malloc(bufsize * sizeof(char*));
  char *input;

  if (!inputs_ar) {

    fprintf(stderr, "Allocation error\n");
    exit(EXIT_FAILURE);

  }

  input = strtok(line, DELIMITERS);


  while (input != NULL) {

    inputs_ar[i] = input;

    i++;


    if (i >= bufsize) {

      bufsize += BUFSIZE;
      inputs_ar = realloc(inputs_ar, bufsize * sizeof(char*));

      if (!inputs_ar) {

        fprintf(stderr, "Allocation error!\n");
        exit(EXIT_FAILURE);
      }
    }

    input = strtok(NULL, DELIMITERS);

  }

  inputs_ar[i] = NULL;

  return inputs_ar;

}


///////////////////////////////////////////////////////////////////////////////////////////////////


char *read_line(void) {

  char *line = NULL;
  ssize_t bufsize = 0; // have getline allocate a buffer for us.
  int  i, j;
  int found_word = 0;
  int cmds;
  int where = 0;


  pipes_counter = 0;
  args_right = 0;

  getline(&line, &bufsize, stdin);

  for (i = 0; i < strlen(line); i++)
  {
    if (line[i] == '|') {
      pipes_counter++;
    }
  }



  if (pipes_counter > 0)
  {

    for (cmds = 0; cmds < pipes_counter; cmds++) {

      args_left = 0;


      for (i = where; i < strlen(line); i++)
      {

        if (line[i] == '|') {

          input_numb[cmds] = args_left;
          where = i + 1;

          break;
        }
        else {
          if (isspace(line[i]) || (line[i] == '|')) {
            found_word = 0;

          }
          else
          {
            if (found_word == 0)
              args_left++;

            found_word = 1;

          }
        }

      }

    }


    where = where - 1;

    for (j = where; j < strlen(line); j++)
    {

      if ( isspace(line[j]) || (line[j] == '|')) {
        found_word = 0;
      }
      else
      {
        if (found_word == 0 ) {
          args_right++;

        }

        found_word = 1;

      }
    }


    input_numb[cmds] = args_right;

    total_args = 0;

    total_cmds = cmds;

    for (i = 0 ; i < cmds; i++) {

      total_args = total_args + input_numb[i];


    }
  }
  else {

    args_left = 0;


    if (isspace(line[i]) || (line[i] == '\n') || (line[i] == '\t')) {
      found_word = 0;

    }
    else
    {
      if (found_word == 0) {
        args_left++;
      }

      found_word = 1;

    }


  }


  return line;

}

///////////////////////////////////////////////////////////////////////////////////////////////////

int change_dir(char **cmd)
{

  chdir(cmd[1]);

  return 0;

}

///////////////////////////////////////////////////////////////////////////////////////////////////

int launch_pipe(char **cmd) {

  int i = 0;
  int pipes_fd[2 * pipes_counter];
  int pid;
  int status;
  int j = 0;
  int k = 0;
  int loop_counter;
  int index;
  int seen_args = 0;
  char **exec_inputs;

  for (i = 0; i < pipes_counter; i++) {
    if (pipe(pipes_fd + i * 2) < 0) {
      fprintf(stderr, "Pipe[%d] failed!\n", i + 1);
      exit(EXIT_FAILURE);
    }
  }


  exec_inputs =  malloc(BUFSIZE * sizeof(char*));

  for (i = 0 ; i < total_cmds + 1 ; i++) {

    int loop_counter = 0;
    int index = seen_args;

    while (loop_counter < input_numb[i]) {

      exec_inputs[loop_counter] =  malloc(strlen(cmd[index]) * sizeof(char));
      strcpy(exec_inputs[loop_counter], cmd[index]);

      //fprintf(stderr, "exec input[%d] : %s\n",loop_counter,exec_inputs[loop_counter]);
      index++;
      loop_counter++;

    }

    exec_inputs[loop_counter] = NULL;
    //fprintf(stderr, "exec input[%d] : %s\n",loop_counter,exec_inputs[loop_counter]);
    //fprintf(stderr, "===========\n");

    pid = fork();

    if (pid == 0) {


      //if not first command&& j!= 2*pipes_counter
      if (j != 0 ) {
        if (dup2(pipes_fd[j - 2], 0) < 0) {
          fprintf(stderr, "dup2 failed!\n");
          exit(EXIT_FAILURE);
        }
      }

      //if not last command
      if (i < pipes_counter) {
        if (dup2(pipes_fd[j + 1], 1) < 0) {
          fprintf(stderr, "dup2 failed!\n");
          exit(EXIT_FAILURE);
        }
      }


      for (int q = 0; q < 2 * pipes_counter; q++) {
        close(pipes_fd[q]);
      }


      if (execvp(exec_inputs[0], exec_inputs ) < 0 ) {
        fprintf(stderr, "MyShell: Command not found!\n");
        exit(EXIT_FAILURE);
      }
    }
    else if (pid < 0) {
      fprintf(stderr, "fork failed!\n");
      exit(EXIT_FAILURE);
    }

    j += 2;
    seen_args = seen_args + input_numb[i];

  }

  for (i = 0; i < 2 * pipes_counter; i++) {
    close(pipes_fd[i]);
  }

  for (i = 0; i < pipes_counter + 1; i++) {
    wait(&status);
  }


}



///////////////////////////////////////////////////////////////////////////////////////////////////


int  launch(char **cmd)
{


  int status, exe;


  switch (fork())
  {
  case -1:
    /* fork was unsuccessful */
    fprintf(stderr, "unable to fork!\n");
    return ( -1 );

  case 0:
    /* child process */

    if (cmd) {

      if (execvp(cmd[0], cmd) == -1) {
        fprintf(stderr, "MyShell: Command not found!\n");
      }
    }
    _exit(1);

  default:
    /* parent process */
    wait(&status);

  }

  return 1;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

void about_me(void) {

  fprintf(stderr, "                                         \n");
  fprintf(stderr, "  ****************************************\n");
  fprintf(stderr, "  *     'SHELL IMPLEMENTATION IN C'      *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *  Author: Konstantinos  Bourantas     *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *  A.M:    6145                        *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *  Email:  bourantas@ceid.upatras.gr   *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *  Computer Engineering & Informatics  *\n");
  fprintf(stderr, "  *  Department, University of Patras    *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  *  2016 - 2017                         *\n");
  fprintf(stderr, "  *                                      *\n");
  fprintf(stderr, "  ****************************************\n");
  fprintf(stderr, "                                          \n");

}



///////////////////////////////////////////////////////////////////////////////////////////////////


int main(void) {

  char *line;
  char **args;
  int status = 1;


  do {

    printf("$ ");
    line =  read_line();

    if (strlen(line) > 1) {

      args =  split_line(line);

      if (!strcmp(args[0], "exit")) { exit(1); }
      else if (!strcmp(args[0], "cd")) { change_dir(args);}
      else if (!strcmp(args[0], "about")) { about_me();}
      else {
        if (pipes_counter == 0) {status = launch(args);}
        else {status = launch_pipe(args);}
      }
    }

  } while (1);

  return 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////

