from TestingCore import run_computation_core

def main():
    target_input = input("Target Identity: ")
    
    success, cycles, latency = run_computation_core(target_input)

    print("=" * 40)
    print(f"{'CORE EXECUTION REPORT':^40}")
    print("=" * 40)
    
    if success:
        print(f"RUNTIME STATUS : VALIDATED")
        print(f"IDENTITY MATCH : {target_input}")
        print(f"TOTAL CYCLES   : {cycles}")
        print(f"LATENCY        : {latency:.4f} SEC")
        
        if latency > 0:
            throughput = int(cycles / latency)
            print(f"THROUGHPUT     : {throughput:,} OPS/S")
    else:
        print(f"RUNTIME STATUS : UNRESOLVED")
    
    print("=" * 40)

if __name__ == "__main__":
    main()