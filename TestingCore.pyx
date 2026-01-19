# cython: boundscheck=False
# cython: wraparound=False
# cython: cdivision=True
import time
from libc.stdlib cimport malloc, free
from libc.string cimport strncmp, strlen
from libc.stdio cimport printf

def run_computation_core(str target_identity):
    cdef bytes target_bytes = target_identity.encode('utf-8')
    cdef char* target_c = target_bytes
    cdef Py_ssize_t seq_len = len(target_bytes)
    cdef Py_ssize_t last_idx = seq_len - 1

    cdef char* sequence_pool = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()-_+=~`[]{}|;:,.<>?/"
    cdef Py_ssize_t pool_size = strlen(sequence_pool)

    cdef long long total_cycles = 0
    cdef int is_resolved = 0
    cdef Py_ssize_t i
    cdef int keep_running = 1
    cdef int monitor_counter = 1000000000

    cdef Py_ssize_t* indices = <Py_ssize_t*>malloc(seq_len * sizeof(Py_ssize_t))
    cdef char* current_candidate = <char*>malloc((seq_len + 1) * sizeof(char))

    if not indices or not current_candidate:
        if indices: free(indices)
        if current_candidate: free(current_candidate)
        raise MemoryError()

    for i in range(seq_len):
        indices[i] = 0
    current_candidate[seq_len] = 0

    start_point = time.time()

    with nogil:
        while keep_running:
            total_cycles += 1

            for i in range(seq_len):
                current_candidate[i] = sequence_pool[indices[i]]

            if current_candidate[last_idx] == target_c[last_idx]:
                if strncmp(current_candidate, target_c, seq_len) == 0:
                    is_resolved = 1
                    break

            for i in range(last_idx, -1, -1):
                indices[i] += 1
                if indices[i] < pool_size:
                    break
                else:
                    indices[i] = 0
                    if i == 0:
                        keep_running = 0
                        break

            if is_resolved:
                break
            
            monitor_counter -= 1
            if monitor_counter == 0:
                printf("%lld cycles completed...\n", total_cycles)
                monitor_counter = 1000000000

    end_point = time.time()
    execution_latency = end_point - start_point

    free(indices)
    free(current_candidate)

    return is_resolved == 1, total_cycles, execution_latency