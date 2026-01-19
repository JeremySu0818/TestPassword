# TestPassword

A high-performance computational tool designed to test string matching performance using a Cython-optimized core.

## Description

TestPassword is a benchmarking tool that measures the throughput and latency of a brute-force search algorithm. The core computation is implemented in Cython to leverage C-level optimizations and the `nogil` context for maximum performance.

## Features

- Optimized C-path execution using Cython.
- Performance metrics including total cycles, execution latency, and throughput (operations per second).
- Support for a broad character pool including alphanumeric characters and symbols.

## Prerequisites

- Python 3.x
- A C compiler (e.g., MSVC, GCC, Clang)

## Environment Setup

Install the required Python packages using pip:

```bash
pip install -r requirements.txt
```

The primary dependencies are:

- **Cython**: Used for compiling the performance-critical core.
- **PyInstaller**: Used for packaging the application into a standalone executable.

## Installation and Build

### 1. Build the Cython Extension

To compile the core module for your current environment, run:

```bash
python setup.py build_ext --inplace
```

### 2. Create Standalone Executable (Windows)

Use the provided batch script to automate the build process and package the application:

```cmd
build.bat
```

## Usage

1. Run the application:
   ```bash
   python TestPassword.py
   ```
2. Input the target string when prompted.
3. Review the Core Execution Report for performance metrics.

## Performance Reporting

The report includes:

- Runtime Status: Indicates if the search was completed.
- Total Cycles: The number of combinations tested.
- Latency: The total time taken in seconds.
- Throughput: Calculated operations per second (OPS/S).
