#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    
    pid = fork();
    
    if (pid == -1) {
        perror("Erro en fork");
        return 1;
    }
    
    if (pid == 0) {
        printf("Proceso hijo creado con PID: %d\n", getpid());
        exit(0);
    } else {
        printf("Proceso padre creado con PID: %d\n", getpid());
        printf("Proceso hijo creado con PID: %d\n", pid);
        printf("El hijo es un zombie por 60 segundos\n");

        sleep(60);
        wait(NULL);
        
        printf("Proceso zombie killed\n");
    }
    
    return 0;
}
