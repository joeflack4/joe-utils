#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""Joefuncs - A collection of reusable Python3 functions by Joe Flack
(joeflack4@gmail.com).
"""
from setuptools import setup, find_packages


setup(
    name='joefuncs',
    version='0.1.0',
    author='Joe Flack',
    author_email='joeflack4@gmail.com',
    description=('Joefuncs - A collection of reusable Python3 functions by '
                 'Joe Flack (joeflack4@gmail.com).'),
    long_description=__doc__,
    packages=find_packages(),
    zip_safe=False,
    platforms='any',
    install_requires=[],
    tests_require=[],
    url='http://www.joeflack.net/',
    download_url='https://github.com/joeflack4/joefuncs/tarball/master',
    keywords=['joeflack4', 'functions'],
    license='MIT',
    classifiers=[
        'Development Status :: Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3.6',
        'Environment :: Any',
        'Framework :: None'
    ]
)
