from setuptools import setup, Extension
from Cython.Build import cythonize
import sys

if sys.platform == "win32":
    compile_args = ["/O2"]
else:
    compile_args = ["-O3"]

ext_modules = [
    Extension(
        "TestingCore",
        sources=["TestingCore.pyx"],
        extra_compile_args=compile_args,
    )
]

setup(
    ext_modules=cythonize(
        ext_modules,
        annotate=True,
        compiler_directives={
            "language_level": "3",
            "boundscheck": False,
            "wraparound": False,
            "cdivision": True,
        },
    )
)
