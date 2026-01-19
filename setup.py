from setuptools import setup, Extension
from Cython.Build import cythonize

ext_modules = [
    Extension(
        "TestingCore",
        sources=["TestingCore.pyx"],
        extra_compile_args=['-O3', '-march=native'],
    )
]

setup(
    ext_modules = cythonize(
        ext_modules, 
        annotate=True,
        compiler_directives={'language_level': "3"}
    )
)