#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void* thread_function(void* arg) {
    // Esta función será ejecutada por los hilos creados.
    return NULL;
}

int main() {
    pid_t pid;

    pid = fork();
    if (pid == 0) {
        fork();
        pthread_t thread;
        pthread_create(&thread, NULL, thread_function, NULL);
        pthread_join(thread, NULL);
    }

    fork();

    return 0;
}
