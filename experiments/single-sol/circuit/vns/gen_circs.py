#!/usr/bin/env python3

import os
import signal
import argparse
import shlex, subprocess
import time



def main():
    for i in range(10):
        wget = subprocess.Popen(['./eacirc'])
        wget.wait()
        
        os.replace(r'./circuit.dot', r'circuit_' + str(i) + '.dot')
        os.replace(r'./pruned_circuit.dot', r'pruned_circuit_' + str(i) + '.dot')
        

if __name__ == "__main__":
    main()
